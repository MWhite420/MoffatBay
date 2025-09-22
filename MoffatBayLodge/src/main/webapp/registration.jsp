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
  
    <h2>Create Your Account</h2>
    
	<section class="register-container">	
    	<!-- Registration Form -->
    	<form action="Register" method="post">
        	<div class="form-row name-fields">
           	 <label>Name:</label>
           	 <input type="text" name="firstName" placeholder="First" required>
           	 <input type="text" name="lastName" placeholder="Last" required>
           	 <br>
            	<label>Email:</label>
            	<input type="email" name="email" placeholder="user@example.com" required>
            	<br>
            	<label>Phone:</label>
            	<input type="text" name="phone" placeholder="###-###-####">
        	</div>

        	<div class="form-row">
            	<label>Password:</label>
            	<input type="password" name="password" placeholder="*******" required>
        	</div>

        	<div class="form-row">
            	<label>Confirm Password:</label>
            	<input type="password" name="confirmPassword" placeholder="*******" required>
        	</div>

        	<div class="checkbox-row">
            	<input type="checkbox" name="emailUpdates">
            	I allow Moffat Bay to email me about reservation updates or any concerns.
        	</div>

        	<div class="checkbox-row">
            	<input type="checkbox" name="smsUpdates">
            	I allow Moffat Bay to text me about reservation updates or any concerns.
        	</div>

        	<div class="button-wrapper">
    		 <button type="submit" class="btn primary">Create Account</button>
			</div>
    	</form>	
    </section>
    
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