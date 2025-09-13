<!DOCTYPE html>
<html lang="en">
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
          <li><a href="#">Contact Us</a></li>
          <li><a href="reservation.jsp">Book a room!</a></li>
        </ul>
      </nav>
    </div>

    <div class="header-right">
      <div class="auth-links">
        <img src="images/profileicon.png" alt="Profile Icon" class="profile-icon">
        <a href="loginPage.jsp">Login</a>
        <a href="registration.jsp">Sign Up</a>
      </div>
    </div>
  </header>

  <!-- Hero Section -->
  <section class="hero">
    <h2>Your Escape to Nature Starts Here</h2>
    <p>Discover the beauty of Moffat Bay: where cozy suites, breathtaking views, and endless outdoor adventures await. Plan your getaway today.</p>
    <a href="#" class="btn primary">Book Now!</a>
  </section>

  <!-- Features Section -->
  <section class="features">
    <h2 class="features-title">The choices are endless!</h2>
    <div class="feature">
      <img src="images/suiteicon.png" alt="Bay View Suite Icon" class="feature-icon">
      <h3>Bay View Suite</h3>
      <p>One of our best-selling suites at the lodge comes with floor-to-ceiling windows overlooking Moffat Bay, a private balcony with seating, a cozy fireplace and rustic wood decor.</p>
    </div>
    <div class="feature">
      <img src="images/kayakicon.png" alt="Kayaking Icon" class="feature-icon">
      <h3>Kayaking the Bay</h3>
      <p>Glide across the calm, sparkling waters of Moffat Bay in a kayak. Paddle through hidden coves, discover caves, and enjoy the quiet serenity of nature.</p>
    </div>
    <div class="feature">
      <img src="images/fireicon.png" alt="Fireside Grill Icon" class="feature-icon">
      <h3>Fireside Grill</h3>
      <p>One of the restaurants here at Moffat Bay is Fireside Grill! With a cozy, warm setting and stone fireplace, our guest love to wind down and enjoy a meal!</p>
    </div>
  </section>

  <!-- CTA Section (bottom) -->
  <section class="cta">
    <div class="cta-box">
      <div class="cta-left">
        <img src="images/MoffatBayLogo3.png" alt="Moffat Bay Lodge Logo" class="cta-logo">
      </div>
      <div class="cta-right">
        <p>Start your vacation with a smooth planning process!</p>
        <div class="cta-buttons">
          <a href="registration.jsp" class="btn primary">Sign up</a>
          <span>or</span>
          <a href="loginPage.jsp" class="btn secondary">Log In</a>
        </div>
        <p>For quick and easy booking!</p>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    <div class="footer-nav">
      <a href="Index.jsp">Home</a>
      <a href="#">FAQS</a>
      <a href="#">Contact Us</a>
      <a href="reservation.jsp">Book Now!</a>
    </div>
    <div class="footer-copy">
      &copy;MoffatBay2025
    </div>
  </footer>

</body>
</html>
