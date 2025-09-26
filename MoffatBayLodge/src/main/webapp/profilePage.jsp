<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "userStuff.ReservationManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Moffat Bay Lodge</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=EB+Garamond&family=Roboto&display=swap" rel="stylesheet">

  <!-- Style sheet -->
  <link rel="stylesheet" href="styles.css" />
  <!-- Calendar Widget -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>

  <!-- Header -->
   <header class="header-container">
    <div class="header-left">
      <img src="images/MoffatBayLogo3.png" alt="Moffat Bay Lodge Logo" class="logo-img">
    </div>

    <div class="header-center">
      <h1 class="welcome-message">Welcome, <%= session.getAttribute("fname") %>!</h1>
      <nav class="main-nav">
        <ul>
          <li><a href="Index.jsp">Home</a></li>
          <li><a href="suites.jsp">Suites</a></li>
          <li><a href="attractions.jsp">Attractions</a></li>
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
              <a href="profilePage.jsp">View Reservations</a>
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
  
   <!-- Determine User  -->
<%
    String email = (String) session.getAttribute("userEmail");

    if (email != null) {
        ReservationManager rm = new ReservationManager(); // Create instance of reservation manager class
        rm.setCustomerID(email); // Use customers email for database queries
        int custId = rm.getCustomerID(); // Retrieves customer id

        ResultSet rs1 = rm.confirmedReservations(custId); // Method to return query results
        ResultSet rs2 = rm.completeReservations(custId);
%>
  <!-- Table to display results -->
<div class="table-results">
    <h2 style="text-decoration: underline;">Your Confirmed Reservations</h2>
 <table border="1" cellpadding="10" cellspacing="0" style="margin-top: 20px;">

        <tr>
            <th>Suite Name</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Length of Stay</th>
            <th>Guests</th>
            <th>Status</th>
        </tr>
        <%
            try {
                while (rs1 != null && rs1.next()) { // Loop to print results in table
        %>
        <tr>
            <td><%= rs1.getString("suite_name") %></td><!-- Print query results in table  -->
            <td><%= rs1.getString("check_in") %></td>
            <td><%= rs1.getString("check_out") %></td>
            <td><%= rs1.getInt("length_of_stay") %></td>
            <td><%= rs1.getInt("number_of_guests") %></td>
            <td><%= rs1.getString("status") %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                out.println("<tr><td colspan='6'>Error retrieving reservations.</td></tr>");
            }
        %>
    </table>
</div>

<!-- Same code copied to print reservations based on completed status -->
<div class="table-results">
    <h2 style="text-decoration: underline;">Your Completed Reservations</h2>

    <table border="1" cellpadding="10" cellspacing="0" style="margin-top: 20px;">
        <tr>
            <th>Suite Name</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Length of Stay</th>
            <th>Guests</th>
            <th>Status</th>
        </tr>
        <%
            try {
                while (rs2 != null && rs2.next()) {
        %>
        <tr>
            <td><%= rs2.getString("suite_name") %></td>
            <td><%= rs2.getString("check_in") %></td>
            <td><%= rs2.getString("check_out") %></td>
            <td><%= rs2.getInt("length_of_stay") %></td>
            <td><%= rs2.getInt("number_of_guests") %></td>
            <td><%= rs2.getString("status") %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                out.println("<tr><td colspan='6'>Error retrieving reservations.</td></tr>");
            } finally {
                try {
                    if (rs1 != null) rs1.close();
                    if (rs2 != null) rs2.close();
                    rm.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>
    </table>
</div>

<%
    } else {
        out.println("<p>You must be logged in to view your reservations.</p>");
    }
%>

	


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