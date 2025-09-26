<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Moffat Bay Lodge - Attractions</title>

  <!-- Google fonts config -->
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
  
 <!-- Attractions Section -->
<h1 class="attractions-title">Local Attractions</h1>
<div class="attractions-container">

  <div class="attraction">
    <h2>Fish Watching Tours</h2>
    <div class="attraction-content">
      <img src="images/fishWatching.png" alt="Fish Watching" class="attraction-img">
      <p>Experience a guided tour with our fish watching experts. It has all the thrills of whale 
        watching, but smaller! Guaranteed to excite even the most boring of individuals.</p>
    </div>
  </div>

  <div class="attraction">
    <h2>Moffat Bay Hiking Trails</h2>
    <div class="attraction-content">
      <img src="images/hikingTrails.png" alt="Hiking Trails" class="attraction-img">
      <p>Trade your boots for flip-flops and your survival instincts for vibes. 
        These sun-drenched trails offer stunning views, questionable signage, and just 
        enough incline to make you feel accomplished. Perfect for hikers, wanderers, and 
        anyone who packed snacks but forgot bug spray.</p>
    </div>
  </div>

  <div class="attraction">
    <h2>Kayak Adventures</h2>
    <div class="attraction-content">
      <img src="images/kayaking.png" alt="Kayaking" class="attraction-img">
      <p>Explore the tranquil waters of Moffat Bay with nothing but a paddle, 
        a debatable sense of direction, and the occasional fish judging your technique. 
        Whether you're gliding past forested cliffs or spinning in circles near the dock
        because you can't figure out how to get moving, it's a great way to feel adventurous 
        without actually going very far.</p>
    </div>
  </div>

  <div class="attraction">
    <h2>Moffat Bay's Haunted Lighthouse</h2>
    <div class="attraction-content">
      <img src="images/lighthouse.png" alt="Haunted Lake Lighthouse" class="attraction-img">
      <p>Step inside the region's least structurally sound tourist attraction. 
        Our guided tour includes creaky stairs, suspicious drafts, and the occasional 
        unexplained whisper. It's like a history lesson, but with more mold. Perfect for 
        thrill-seekers, ghost-believers, and anyone who enjoys ignoring obvious red flags.</p>
    </div>
  </div>

  <div class="attraction">
    <h2>Local Artisan Market</h2>
    <div class="attraction-content">
      <img src="images/artisanMarket.png" alt="Artisan Market" class="attraction-img">
      <p>Browse handcrafted goods from people who definitely own more than one kind of jam. 
        From pottery and macrame to knitted hats and mysterious herbal teas, this market has 
        everything you didn't know you needed. Perfect for souvenir hunters, casual browsers, 
        and anyone who enjoys pretending they understand the difference between "rustic" and 
        "vintage."</p>
    </div>
  </div>

</div>

<!-- Reservation Reminder -->
<div class="contact-us">
  <h2>Ready to experience all Moffat Bay has to offer?</h2>
  <div class="button-wrapper">
   <a href="reservation.jsp" class="btn primary">Book Your Stay</a>
  </div>
</div>
 
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
