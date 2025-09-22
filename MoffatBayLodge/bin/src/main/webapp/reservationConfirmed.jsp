<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

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
	
	<section class = "register-container">
	
	<% 
		String confirm = (String)request.getAttribute("confirmed");
		if (confirm.equals("submitted")){
			%>
			<h2>Reservation submitted successfully</h2>
			<div class = button-wrapper>
			<a href= "Index.jsp" class= "btn primary">Return to homepage</a>
			<a href= "#" class= "btn primary">View all reservations</a>
			</div>
			<% 
		}else if(confirm.equals("unavailableRoom")){
			%>
			<h2>Selected room is unavailable for selected dates</h2>
			<div class = button-wrapper>
			<a href= "reservation.jsp" class= "btn primary">Try again</a>
			<a href = "index.jsp" class= "btn primary">Return to homepage</a>
			</div>
			
			<%
		}else{
			%>
			<div class = button-wrapper>
			<h2>Something went wrong on our end. Please try again later</h2>
			<a href= "reservation.jsp" class= "btn primary">Try again</a>
			<a href = "index.jsp" class= "btn primary">Return to homepage</a>
			</div>
			<% 
		}
	
	%>
	
	</section>
	
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