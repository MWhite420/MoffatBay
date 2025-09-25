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

  <!-- Hero Section -->
  <section class="hero">
    <h2>Your Escape to Nature Starts Here</h2>
    <p>Discover the beauty of Moffat Bay: where cozy suites, breathtaking views, and endless outdoor adventures await. Plan your getaway today.</p>
    <a href="reservation.jsp" class="btn primary">Book Now!</a>
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
  <%
  	if (session.getAttribute("fname") != null){
  		%>
	  	<section class="cta">
	    <div class="cta-box">
	      <div class="cta-left">
	        <img src="images/MoffatBayLogo3.png" alt="Moffat Bay Lodge Logo" class="cta-logo">
	      </div>
	      <div class="cta-right">
	        <p>Start your vacation with a smooth planning process!</p>
	        <div class="cta-buttons">
	          <a href="reservation.jsp" class="btn primary">Book now!</a>
	        </div>
	        
	      </div>
	    </div>
	  </section>
  	<%
  		
  	}else{
  	%>
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
  	<% } %>
  		
  	  <section class="cta">
	    <div class="cta-box">
	     
	        <img src="images/SalishSalmon.png" width="200" height="200" alt="Salish Salmon Logo" >
	      
	      <div class="cta-right">
	      	<h2>Supporting Salish Salmon and Local Wildlife</h2>
	        <p>At Moffat Bay Resort, we are proud to call the Salish Sea our home. We are not the only ones
	         who depend on its pristine waters, so do the wild salmon, orcas, bald eagles, and countless other 
	         species that make this place so special.
	         <br>
	         Wild Pacific salmon are the heartbeat of the Salish Sea ecosystem. They nourish marine life, 
	         sustain Indigenous cultures, and support a way of life thats been thriving here for thousands of years. 
	         Yet today, their populations are under threat due to habitat loss, warming waters, and human impact.</p>
	       </div>
	       <div class="cta-right">
	         <h2>Our Commitment and How You Can Help</h2>
	         <p>
	           <ul>
	         	<li>We partner with local conservation groups restoring salmon habitats.</li>
 				<li>We use eco-friendly practices to reduce runoff and pollution.</li>
 				<li>We do not support farmed salmon operations that harm wild populations.</li>
			   </ul>
			    <b>YOU CAN:</b>
			    <ul>
 				<li>Support local, sustainable seafood.</li>
 				<li>no-wake zones and marine wildlife guidelines.</li>
				<li>Learn about and share the story of the salmon.</li>
 				<li>Join us in donating or volunteering with regional conservation efforts.</li>
 				</ul>
 				<b>Support and Donation Sites:</b>
 				<ul>
 					<li><a href="https://salishcenter.org/2025/05/01/saving-the-salish-sea-a-call-to-protect-what-cannot-be-replaced/">Salish Center</a></li>
 					<li><a href="https://marinesurvivalproject.com/">Marine Survival</a></li>
 					<li><a href="https://psf.ca/work/habitat/marine-research/">Marine Habitat and Research</a></li>
 				</ul>
 			</div>
	      </div>
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
