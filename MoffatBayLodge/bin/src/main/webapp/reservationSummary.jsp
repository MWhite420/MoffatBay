<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import= "java.time.Period" %>
<%@ page import= "java.time.*" %>
<%@ page import = "userStuff.ReservationManager" %>
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
  
    <!-- Success Message -->
  <section class="register-container">
  
  <% 
  	String fname = session.getAttribute("fname").toString();
  	String lname = session.getAttribute("lname").toString();
  	String email = session.getAttribute("userEmail").toString();
  	String phone = request.getParameter("phone");
  	String checkin = request.getParameter("checkin");
  	String checkout = request.getParameter("checkout");
  	String guests = request.getParameter("guests");
  	String roomType = request.getParameter("roomType");
  	
	LocalDate checkIn = LocalDate.parse(checkin);
	LocalDate checkOut = LocalDate.parse(checkout);
	
	Period period = Period.between(checkIn, checkOut);
	int lengthOfStay = period.getDays();
	
	//get total price]
	ReservationManager res = new ReservationManager();
	res.setPrice(roomType, lengthOfStay);
	int totalPrice = res.getPrice();
	

	
//getprice needed
  	
  	
  %>
    <h2 style="text-decoration: underline;">Reservation Summary</h2>


    <table border="1" cellpadding="10" cellspacing="0" style="margin-top: 20px;">
      <tr>
        <th>Name: </th>
        <td><%= fname %> <%= lname %></td>
      </tr>
      <tr>
        <th>Email:</th>
        <td><%= email %></td>
      </tr>
      <tr>
        <th>Phone:</th>
        <td><%= phone  %></td>
      </tr>
      <tr>
        <th>Check-In:</th>
        <td><%= checkin  %></td>
      </tr>
      <tr>
        <th>Check-Out:</th>
        <td><%= checkout %></td>
      </tr>
      <tr>
        <th>Guests:</th>
        <td><%= guests %></td>
      </tr>
      <tr>
        <th>Room Type:</th>
        <td><%= roomType %></td>
       </tr>
       <tr>
        <th>Length Of Stay:</th>
        <td><%= lengthOfStay %> nights </td>
       </tr>
       <tr>
       	<th>Total Price:</th>
       	<td>$<%= totalPrice %></td>
       </tr>
       
 		<%res.close();%>
    </table>
    

    <div class="button-wrapper">
     <p style="color: #392A16;"><b> Is this correct? </b></p>
    <!--  sending values to servlet -->
	<form method="post" action="Reserve">
	    <input type="hidden" name="checkin" value="<%= checkin %>">
	    <input type="hidden" name="checkout" value="<%= checkout %>">
	    <input type="hidden" name="length" value="<%= lengthOfStay %>">
	    <input type="hidden" name="guests" value="<%= guests %>">
	    <input type="hidden" name="roomType" value="<%= roomType %>">
	    <input type="hidden" name="email" value="<%= email %>">
	    
	    <button type="submit" class="btn primary">Yes! Confirm Reservation</button>
	    <a href= "reservation.jsp" class= "btn primary">No. Take me back</a>
	</form>
      
     
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