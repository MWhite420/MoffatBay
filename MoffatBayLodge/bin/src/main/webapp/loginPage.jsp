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
  
  <h2>Welcome Back!</h2>
  
  <!-- Login Box -->
<section class="register-container">
  
  
  <form action="loginCheck.jsp" method="POST" class="login-form">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Enter your email" required> <br>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter your password" required>

    <div class="login">
      <button type="submit" class="btn primary">Login</button>
       <button type="button" class="btn primary" onclick="window.location.href='resetRequest.jsp'">Reset Password</button>
    </div>
    
  </form>

  <div class="signup-section">
    <p>Don't have an account? <br> No worries! Create an account here: </p>
    <button type="button" class="btn primary" onclick="window.location.href='registration.jsp'">Sign Up</button>
  </div>
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