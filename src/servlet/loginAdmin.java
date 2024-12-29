package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.admin;
import services.adminService;
import java.io.IOException;


@WebServlet("/loginAdmin")
public class loginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public loginAdmin() {
        super();
        
       }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		admin admin1 =new admin();
		admin1.setUsername(request.getParameter("username"));
		admin1.setPassword(request.getParameter("password"));
		
		adminService service = new adminService();
		boolean status = service.validateAdmin(admin1);
		
		if(status) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.html");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("errorMessage", "Invalid username or password");
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin_login.jsp");
			
			dispatcher.forward(request, response);
		}
		
		
	}

}
