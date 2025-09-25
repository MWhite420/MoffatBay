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
   <style>
   	h1 {
   	text-align: center;
   	text-decoration: underline;
   	}
   </style>
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
  
 <!-- Suites Section -->
 <h1>Suites Selection</h1>
<div class="suites">
 <h2>Bay View Suite</h2>
 <p><b>Price: $315/night</b></p>
 <div class="suites-content">
    <img src="images/BayView.png" alt="bay view suite" class="suiteimg">
    <p>The Bay View Suite offers floor-to-ceiling windows with sweeping views of Moffat Bay,
     a private balcony perfect for morning coffee or sunset toasts, and a cozy fireplace framed 
     by rustic wood décor. Designed with couples in mind, it’s the ideal setting for a romantic get away.</p>
  </div>
</div>

<div class="suites">
 <h2>Adventure Suite</h2>
 <p><b>Price: $189/night</b></p>
 <div class="suites-content">
	<img src="images/AdventureSuite.png" alt="adventure suite" class="suiteimg">
  <p>Designed with hikers and kayakers in mind, this suite features convenient gear storage, 
  durable flooring, and extra drying racks to handle wet equipment with ease. Though compact, 
  it offers a functional layout with floor-to-ceiling windows overlooking Moffat Bay, making it the perfect retreat for outdoor explorers.</p>
  </div>
</div>

<div class="suites">
 <h2>Whale Watcher Suite</h2>
 <p><b>Price: $262/night</b></p>
 <div class="suites-content">
  <img src="images/WhaleWatcher.png" alt="Lodge Lobby" class="suiteimg">
  <p>Immerse yourself in panoramic ocean views with this marine-inspired suite. Outfitted with a spotting scope and binoculars for whale watching, 
  and accented with whale-themed décor, it’s a perfect stay for ocean lovers and wildlife enthusiasts.</p>
  </div>
</div>

<div class="suites">
 <h2>Divers Retreat Suite</h2>
 <p><b>Price: $231/night</b></p>
 <div class="suites-content">
    <img src="images/DiversRetreat.png" alt="Lodge Lobby" class="suiteimg">
  <p>Styled in a nautical theme with rich ocean blues, this suite offers easy access to the marina for your next adventure. With a dedicated rinse and drying area for gear, 
  it’s the ideal choice for boaters, anglers, and water enthusiasts.</p>
  </div>
</div>

<div class="suites">
 <h2>Family Lodge Suite</h2>
 <p><b>Price: $210/night</b></p>
 <div class="suites-content">
    <img src="images/FamilyLodge.png" alt="Lodge Lobby" class="suiteimg">
  <p>Perfect for families, this two-bedroom suite features a cozy shared living space and a small kitchenette for easy meals. Kids will love the cabin-style bunk beds and game chest, 
  making it a warm and welcoming retreat for everyone.p></p>
  </div>
</div>

<div class="suites">
 <h2>Luxory Spa Suite</h2>
 <p><b>Price: $525/night</b></p>
 <div class="suites-content">
    <img src="images/LuxorySpa.png" alt="Lodge Lobby" class="suiteimg">
  <p>Indulge in ultimate relaxation with an in-room hot tub or soaking tub, complemented by access to spa services like massage and sauna. Featuring premium linens and luxurious finishing touches, 
  this suite offers a sophisticated retreat for those seeking comfort and pampering.</p>
  </div>
</div>

<!-- Reservation Reminder -->
<div class="contact-us">
  <h2>Dont forget to book a reservation for one of these beautiful suites!</h2>
  <div class="button-wrapper">
   <a href="reservation.jsp" class="btn primary">Book Now</a>
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