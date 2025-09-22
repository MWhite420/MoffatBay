<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="userStuff.UserClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String email = request.getParameter("email");
    boolean emailExists = false;

    // Checks to see if email address is valid
    if (email != null && !email.trim().isEmpty()) {
    	UserClass db = new UserClass();
        String sql = "SELECT * FROM CustomerLogin WHERE LOWER(email) = ?";
        try (PreparedStatement stmt = db.getConnection().prepareStatement(sql)) {
            stmt.setString(1, email.toLowerCase());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    emailExists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.close();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=EB+Garamond&family=Roboto&display=swap" rel="stylesheet">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="styles.css" />
</head>
<body>

<!-- Header -->
 <header class="header-container">
    <div class="header-left">
      <img src="images/MoffatBayLogo3.png" alt="Moffat Bay Lodge Logo" class="logo-img">
    </div>

    <div class="header-center">
      <h1 class="welcome-message">Moffat Bay Lodge</h1>
      <nav class="main-nav">
        <ul>
          <li><a href="Index.jsp">Home</a></li>
          <li><a href="#">Suites</a></li>
          <li><a href="#">Attractions</a></li>
          <li><a href="about.jsp">About us</a></li>
          <li><a href="reservation.jsp">Book a room!</a></li>
        </ul>
      </nav>
    </div>

    <div class="header-right">
      <div class="auth-links">
      <% 
          if(session.getAttribute("fname") != null){
              %>
              <img src="images/profileicon.png" alt="Profile Icon" class="profile-icon">
              <%
              out.print("Hello, " + session.getAttribute("fname") + "!");
              %>
              <a href="logoutPage.jsp">Logout</a>
              <%
          }else{
              %>
            <img src="images/profileicon.png" alt="Profile Icon" class="profile-icon">
            <a href="loginPage.jsp">Login</a>
            <a href="registration.jsp">Sign Up</a>
            <%
              }
            %>
      </div>
    </div>
  </header>

<main>
    <div class="content-container">
        <% if (emailExists) { %>
          <!-- If the email exists in the database, show the form to set a new password -->
            <h2>Set a New Password</h2>
            <form action="resetConfirm.jsp" method="post">
                <input type="hidden" name="email" value="<%= email %>">
                <label for="password">New Password:</label><br>
                <input type="password" name="password" required><br><br>
                <input type="submit" value="Reset Password">
            </form>
        <% } else { %>
            <!-- If the email doesn't exist, shows an error message and link to try again -->
            <p style="color:red;">Email not found in our system.</p>
            <a href="resetRequest.jsp">Go back and try again</a>
        <% } %>
    </div>
</main>

<!-- Footer -->
 <footer>
    <div class="footer-nav">
      <a href="Index.jsp">Home</a>
      <a href="#">FAQS</a>
      <a href="about.jsp">About Us</a>
      <a href="reservation.jsp">Book Now!</a>
    </div>
    <div class="footer-copy">
      &copy;MoffatBay2025
    </div>
  </footer>

</body>
</html>
