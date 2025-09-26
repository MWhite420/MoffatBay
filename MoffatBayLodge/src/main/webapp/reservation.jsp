<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
      <h1 class="welcome-message">Moffat Bay Lodge</h1>
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
  
   
    
    	<%
    	System.out.println(session.getAttribute("fname"));
    	  if (session.getAttribute("fname") != null){

    	%>
    	 <section class="register-container">
    	 <h2 style="text-decoration: underline;">Book a Reservation</h2>
    	<form action="reservationSummary.jsp" method="post">
        	<label for="firstName">First Name:</label>
        	<input type="text" name="firstName" id="firstName" value= <%=session.getAttribute("fname") %> disabled>

        	<label for="lastName">Last Name:</label>
        	<input type="text" name="lastName" id="lastName" value= <%=session.getAttribute("lname") %> disabled>
        	<br>
        	<label for="email">Email:</label>
        	<input type="email" name="email" id="email" value= <%=session.getAttribute("userEmail") %> disabled>
        	<br>
        	<label for="phone">Phone:</label>
        	<input type="tel" name="phone" id="phone" required>
        	<br>
        	<label for="checkin">Check-In Date:</label>
			<input type="date" name="checkin" id="checkin" required>
			<br>
			<label for="checkout">Check-Out Date:</label>
			<input type="date" name="checkout" id="checkout" required>
			<br>
        	<label for="guests">Number of Guests:</label>
        	<input type="number" name="guests" id="guests" min="1" max= "4" required>
        	<br>
        	<label for="roomType">Room Type:</label>
        	<select name="roomType" id="roomType" required>
            	<option value="Bay View Suite">Bay View Suite</option>
            	<option value="Adventure Suite">Adventure Suite</option>
            	<option value="Whale Watcher Suite">Whale Watcher Suite</option>
            	<option value="Divers Retreat Suite">Divers Retreat Suite</option>
            	<option value="Family Lodge Suite">Family Lodge Suite</option>
            	<option value="Luxury Spa Suite">Luxury Spa Suite</option>
        	</select>
			
			<div class="button-wrapper">
				<button type="submit" class="btn primary">Submit Reservation</button>
			</div>
    	</form>
	</section>
	
	<% } else{ 
			%>
			<p> ** Psst! It looks like you're not logged in! Please log in <a href="loginPage.jsp">here</a> before booking</p>
			
		<%
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