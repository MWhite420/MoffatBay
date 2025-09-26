<%@ page import="userStuff.UserClass" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Get email and new password from the form submission
    String email = request.getParameter("email");
    String newPassword = request.getParameter("password");

    // Check if required parameters are missing or empty
    if (email == null || newPassword == null || email.trim().isEmpty() || newPassword.trim().isEmpty()) {
        out.println("<p>Missing email or new password.</p>");
    } else {
    	UserClass db = new UserClass(); // New db connection
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt()); //Hash password with BCrypt

        String sql = "UPDATE CustomerLogin SET password_hash = ? WHERE email = ?";

        // Prepared statement to update database with new hashed password
        try (PreparedStatement stmt = db.getConnection().prepareStatement(sql)) {
            stmt.setString(1, hashedPassword);
            stmt.setString(2, email.trim());

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) { //If succesful
                out.println("<h2>Password reset successful for " + email + "</h2>"); 
                out.println("<a href='loginPage.jsp'>Return to Login</a>");
            } else {
                out.println("<p>Email not found or password not updated.</p>"); //If it fails
            }

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error resetting password.</p>");
        } finally {
            db.close();
        }
    }
%>
