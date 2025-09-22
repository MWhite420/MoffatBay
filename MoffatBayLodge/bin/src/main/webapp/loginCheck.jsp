<%@ page import="userStuff.UserClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Uses DatabaseBean to connect to the database
    UserClass db = new UserClass();
    boolean isValid = db.loginCheck(email, password);
    
    

    // Checks to see it the users email and password are valid
    if (isValid) {
        out.println("<h2>Login successful!</h2>");
        session.setAttribute("userEmail", email);
       
        String fname = db.getFname();
        String lname = db.getLname();
        session.setAttribute("fname", fname);
        session.setAttribute("lname", lname);
        response.sendRedirect("Index.jsp");
          
        db.close();
        
    } else {
    	
    	%>
    	<!-- header from other pages -->
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
	  
	  <div class = button-wrapper>
        <h2>Login failed. Invalid email or password.</h2>
       	<a href="loginPage.jsp" class="btn primary">Try again</a>
       </div>
       
       <% 
        db.close();
    	}
		%>
</body>