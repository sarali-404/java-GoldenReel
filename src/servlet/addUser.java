package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.user;
import services.userService;

import java.io.IOException;

@WebServlet("/addUser")
public class addUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public addUser() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            // Set the error message
            request.setAttribute("errorMessage", "Passwords do not match!");
            // Set the form data to preserve user input
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            // Forward back to the signup page
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Proceed with user registration
        user u = new user();
        u.setName(name);
        u.setEmail(email);
        u.setUsername(username);
        u.setPassword(password);

        userService service = new userService();
        service.regUser(u);

        // Redirect to login page after successful registration
        response.sendRedirect("login.jsp");
    }
}
