package userStuff;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;

/*
 * This code was developed with assistance from ChatGPT, 
 * Portions of the code are adapted from the suggestions provided during the conversation.\
 * Utilized code from: https://medium.com/@bhupendra_Maurya/password-hashing-using-bcrypt-e36f5c655e09
 * to help with hashing
 */


public class UserClass {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/moffatbay";
    private final String jdbcUsername = "moffatbay_user";
    private final String jdbcPassword = "Moffat123!";

    private Connection connection;

    private String fname;
    private String lname;
    private String email;
    private String phone;
    private String street;
    private String city;
    private String state;
    private String postal;
    private String country;
    private String password;
    private int customerId;

    public UserClass() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Getters and setters
    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }
    
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    public String getPostal() {
        return postal;
    }

    public void setPostal(String postal) {
        this.postal = postal;
    }
    
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getCustomerId() {
        return customerId;
    }

    public Connection getConnection() {
        return connection;
    }

    // Validates user by email and plain password using bcrypt hash check
    // Used ai to fix select statements 
    public boolean loginCheck(String email, String plainPassword) {
        String sql = "SELECT cl.customer_id, c.first_name, c.last_name, cl.password_hash " +
                     "FROM CustomerLogin cl " +
                     "JOIN Customers c ON cl.customer_id = c.customer_id " +
                     "WHERE cl.email = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String hashedPassword = rs.getString("password_hash");
                    if (BCrypt.checkpw(plainPassword, hashedPassword)) {
                        this.customerId = rs.getInt("customer_id");
                        this.fname = rs.getString("first_name");
                        this.lname = rs.getString("last_name");
                        return true;
                    } else {
                        System.out.println("Incorrect password");
                        return false;
                    }
                } else {
                    System.out.println("Email not found");
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Saves user profile and login info in a transaction
    public boolean saveUser() {
        System.out.println("Attempting to save user to database...");
        boolean success = false;

        String insertCustomerSQL = "INSERT INTO Customers (first_name, last_name, email, phone, street_address, city, state, postal_code, country) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?)";
        String insertLoginSQL = "INSERT INTO CustomerLogin (customer_id, email, password_hash) VALUES (?, ?, ?)";

        try {
            connection.setAutoCommit(false); 

            // Insert into Customers table
            try (PreparedStatement stmtCustomer = connection.prepareStatement(insertCustomerSQL, Statement.RETURN_GENERATED_KEYS)) {
                stmtCustomer.setString(1, fname);
                stmtCustomer.setString(2, lname);
                stmtCustomer.setString(3, email);
                stmtCustomer.setString(4, phone);
                stmtCustomer.setString(5, street);
                stmtCustomer.setString(6, city);
                stmtCustomer.setString(7, state);
                stmtCustomer.setString(8, postal);
                stmtCustomer.setString(9, country);

                int rowsInserted = stmtCustomer.executeUpdate();

                if (rowsInserted == 0) {
                    connection.rollback();
                    return false;
                }

                // Get the generated customer_id
                try (ResultSet generatedKeys = stmtCustomer.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int generatedCustomerId = generatedKeys.getInt(1);
                        this.customerId = generatedCustomerId;

                        // Insert into CustomerLogin table
                        try (PreparedStatement stmtLogin = connection.prepareStatement(insertLoginSQL)) {
                            stmtLogin.setInt(1, generatedCustomerId);
                            stmtLogin.setString(2, email);
                            stmtLogin.setString(3, password); // hashed password

                            int loginRowsInserted = stmtLogin.executeUpdate();
                            if (loginRowsInserted == 0) {
                                connection.rollback();
                                return false;
                            }
                        }
                    } else {
                        connection.rollback();
                        return false;
                    }
                }
            }

            connection.commit();
            success = true;

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }


    // Closes connection
    public void close() {
        try {
            if (connection != null && !connection.isClosed())
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

