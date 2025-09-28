package userStuff;

import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward GET requests to the registration form
        request.getRequestDispatcher("registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Read form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postal = request.getParameter("postal");
        String country = request.getParameter("country");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validation
        if (firstName == null || lastName == null || email == null || street == null ||
            city == null || state == null || postal == null || password == null ||
            confirmPassword == null || firstName.isEmpty() || lastName.isEmpty() ||
            email.isEmpty() || street.isEmpty() || city.isEmpty() || state.isEmpty() ||
            postal.isEmpty() || country.isEmpty() || password.isEmpty() ||
            confirmPassword.isEmpty()) {

            request.setAttribute("errorMessage", "Please fill in all required fields.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        }

        // Hash password with bcrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Create user object
        UserClass user = new UserClass();
        user.setFname(firstName);
        user.setLname(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setStreet(street);
        user.setCity(city);
        user.setState(state);
        user.setPostal(postal);
        user.setCountry(country);
        user.setPassword(hashedPassword);

        // Save to DB
        boolean userSaved = user.saveUser();

        if (userSaved) {
            response.sendRedirect("loginPage.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to register. Please try again.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
    }
}
