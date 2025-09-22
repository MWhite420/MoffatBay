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
          <li><a href="#">About us</a></li>
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
  
 <!-- About Us Section -->
  <h2>About Us</h2>
 
<div class="about-us">
    <img src="images/MoffatBayLobby.jpg" alt="Lodge Lobby" class="about-image imageLeft">
  <p>Welcome to the Moffat Bay Lodge, a hidden gem where the forest meets the sea. 
     Nestled along the shores of a peaceful bay, our lodge was built on the belief that relaxation comes from slowing down, 
     reconnecting with nature, and creating memories with the people who matter most.</p>
</div>


<div class="about-us">
    <p>What began as a simple rest stop for travelers seeking the quiet beauty of nature has grown into a place 
       where guests can experience the best of the Pacific Northwest. From the call of whales echoing through the 
       bay to the rustle of pine trees on our numerous hiking trails, every corner of Moffat Bay holds a story waiting to 
       be discovered. </p>
     <img src="images/MoffatBayPool.jpg" alt="Outside View" class="about-image imageRight">
</div>

<!-- Contact Us Section -->
<div class="contact-us">
  <h2>Contact Us</h2>
  <p><strong>Phone:</strong> (+1) 807-777-7367</p>
  <p><strong>Email:</strong> <a href="mailto:Lodge@MoffatBay.com">Lodge@MoffatBay.com</a></p>
  <p><strong>Address:</strong></p>
  <address>
    2456 Lodge Dr.<br>
    New Haven, CT<br>
    28271
  </address>
  
  <div class="button-wrapper">
   <a href="reservation.jsp" class="btn primary">Book Now</a>
</div>
   
</div>


 
  <!-- Footer -->
  <footer>
    <div class="footer-nav">
     <a href="index.jsp">Home</a>
      <a href="#">FAQS</a>
      <a href="about.jsp">About Us</a>
      <a href="#">Book Now!</a>
    </div>
    <div class="footer-copy">
      &copy;MoffatBay2025
    </div>
  </footer>

</body>
</html>