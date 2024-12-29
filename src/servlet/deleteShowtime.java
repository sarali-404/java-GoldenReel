package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import services.showtimeService;

import java.io.IOException;

@WebServlet("/deleteShowtime")
public class deleteShowtime extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public deleteShowtime() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String showtimeId = request.getParameter("showtimeId");
        System.out.println("Received showtimeId: " + showtimeId); // Debugging log

        if (showtimeId != null && !showtimeId.isEmpty()) {
            try {
                showtimeService service = new showtimeService();
                boolean isDeleted = service.deleteShowtimeById(Integer.parseInt(showtimeId));

                if (isDeleted) {
                    response.sendRedirect("manageShowtimes.jsp?status=success");
                } else {
                    response.sendRedirect("manageShowtimes.jsp?status=error");
                }
            } catch (Exception e) {
                e.printStackTrace(); // Log exception
                response.sendRedirect("manageShowtimes.jsp?status=error");
            }
        } else {
            response.sendRedirect("manageShowtimes.jsp?status=invalid");
        }

	}

	

}
