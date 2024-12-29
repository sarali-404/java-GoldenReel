package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.showtimes;
import services.showtimeService;

import java.io.IOException;
import java.util.List;

@WebServlet("/manageShowtimes")
public class manageShowtimes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public manageShowtimes() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
		        showtimeService showtimeService = new showtimeService();
		        List<showtimes> showtimeList = showtimeService.getAllShowtimes();
		        System.out.println("Passing showtimeList to JSP");
		        request.setAttribute("showtimeList", showtimeList);
		        
		        RequestDispatcher dispatcher = request.getRequestDispatcher("manageShowtimes.jsp");
		        dispatcher.forward(request, response);
		    } catch (Exception e) {
		        e.printStackTrace();
		        // Set a message attribute and forward to an error page if needed
		        request.setAttribute("errorMessage", "There was an issue fetching showtimes.");
		        RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp");
		        dispatcher.forward(request, response);
		    }
	       
		
	}

	
}
