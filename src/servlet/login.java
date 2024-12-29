package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.user;
import services.userService;

import java.io.IOException;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		user u = new user();
		u.setUsername(request.getParameter("username"));
		u.setPassword(request.getParameter("password"));
		
		userService service = new userService();
		boolean status = service.validate(u);
		
		if(status) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("errorMessage", "Invalid username or password");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			
			dispatcher.forward(request, response);
		}
		
		doGet(request, response);
	}

}
