package userStuff;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Period;
import java.time.*;

public class ReservationManager {
	private final String jdbcURL = "jdbc:mysql://localhost:3306/moffatbay";
    private final String jdbcUsername = "moffatbay_user";
    private final String jdbcPassword = "Moffat123!";
    
    private Connection connection;
    
    private int customerID;
    private int suiteID; 
    private String checkIn;
    private String checkOut;
    private int lengthOfStay;
    private int numberOfGuests; 
    private String status;
    private int price;
    
    public ReservationManager(){
    	 try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
         } catch (ClassNotFoundException | SQLException e) {
             e.printStackTrace();
         }
    }
    
    //customer ID is found based on the user's email because it is a unique identifier 
    public void setCustomerID(String email) {
    	String query = "SELECT * FROM customers WHERE email = ?";
    	
    	try {
			PreparedStatement stmt = connection.prepareStatement(query);
			stmt.setString(1, email);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				int id = rs.getInt("customer_id");
				this.customerID = id;
			}
			
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
    	
 
    }
    
   public int getCustomerID(){
	   return this.customerID;
   }
   
   //suite ID set based on given suite name
   public void setSuiteID(String suite){
	   String query = "SELECT * FROM suites WHERE suite_name = ?";
   	try {
			PreparedStatement stmt = connection.prepareStatement(query);
			stmt.setString(1, suite);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				int thisID = rs.getInt("suite_id");
				this.suiteID = thisID;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
   
   		
   	}
   
   public int getSuiteID() {
	   return this.suiteID;
   }
   
   public void setCheckIn(String checkin) {
	   this.checkIn = checkin;
   }
   
   public String getCheckin() {
	   return this.checkIn;
   }
   
   public void setCheckOut(String checkout) {
	   this.checkOut = checkout;
   }
   
   public String getCheckOut() {
	   return this.checkOut;
   }
   
   public void setLengthOfStay(int length) {
	   this.lengthOfStay = length;

   }
   
   public int getLengthOfStay() {
	   return this.lengthOfStay;
   }
   
   public void setNumberOfGuests(int guests) {
	   this.numberOfGuests = guests;
	   
   }
   
   public int getNumberofGuests() {
	   return this.numberOfGuests;
   }
   
   public void setStatus(String status) {
	   this.status = status;
   }
   
   public String getStatus() {
	   return this.status;
   }
   
   //price found based on suite name to get id and length of stay for total price
   public void setPrice(String suite, int length) {
	   String query = "SELECT * FROM suites WHERE suite_name = ?";
   	try {
			PreparedStatement stmt = connection.prepareStatement(query);
			stmt.setString(1, suite);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) { 
				this.price = rs.getInt("price_per_night") * length;
				System.out.println(this.price);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
   }
   
   public int getPrice() {
	   return this.price;
   }
   
   public void submitReservation() {
	   String query = "INSERT INTO reservations (customer_id,suite_id, check_in, check_out, length_of_stay, number_of_guests, status) VALUES(?,?,?,?,?,?,?)";
	   try {
		PreparedStatement stmt = connection.prepareStatement(query);
		stmt.setInt(1, this.customerID);
		stmt.setInt(2, this.suiteID);
		stmt.setString(3,  this.checkIn);
		stmt.setString(4, this.checkOut);
		stmt.setInt(5,  this.lengthOfStay);
		stmt.setInt(6,  this.numberOfGuests);
		stmt.setString(7, "confirmed");
		stmt.executeUpdate();
		this.status = "confirmed";
		
		System.out.println("Reservation for customer ID " + this.customerID + "submitted");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
   }
   
   
   //checks if a room is available by checking the suitIds and the dates they have been booked in other reservations
   public boolean isAvailable() {
	   String query = "SELECT * FROM reservations WHERE suite_ID = ?";
	   boolean availability = true;
	   
	   try {
		PreparedStatement stmt = connection.prepareStatement(query);
		stmt.setInt(1, this.suiteID);
		ResultSet rs = stmt.executeQuery();
		//convert this reservation's date to a date 
		LocalDate thisCheckin = LocalDate.parse(this.checkIn);
		
		while (rs.next()) {
			//convert checkin and checkout dates to dates
			LocalDate resCheckin = LocalDate.parse(rs.getString("check_in"));
			LocalDate resCheckout = LocalDate.parse(rs.getString("check_out"));
			String status = rs.getString("status");
			
			//if this reservation's checkin date is between another reservation's checkin and checkout, method returns false.
			if ((thisCheckin.isAfter(resCheckin)) && (thisCheckin.isBefore(resCheckout)) ) {
				if (status.equals("cancelled")) {
					availability = true;
				}else {
					availability = false;
					return availability;
			}
		}
		
		}	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	}
	   return availability;
	   
   }
   
   // Returns reservation status for confirmed reservations
   public ResultSet confirmedReservations(int customerId) {
	    String query = "SELECT r.*, s.suite_name FROM reservations r " +
	                   "JOIN suites s ON r.suite_id = s.suite_id " +
	                   "WHERE r.customer_id = ? AND r.status = 'confirmed'";
	    try {
	        PreparedStatement stmt = connection.prepareStatement(query);
	        stmt.setInt(1, customerId);
	        return stmt.executeQuery();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

   public ResultSet completeReservations(int customerId) {
	    String query = "SELECT r.*, s.suite_name FROM reservations r " +
	                   "JOIN suites s ON r.suite_id = s.suite_id " +
	                   "WHERE r.customer_id = ? AND r.status = 'complete'";
	    try {
	        PreparedStatement stmt = connection.prepareStatement(query);
	        stmt.setInt(1, customerId);
	        return stmt.executeQuery();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
   
   //close
   public void close() {
       try {
           if (connection != null && !connection.isClosed())
               connection.close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
   }
}
   
   
