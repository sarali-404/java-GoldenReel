package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.filmpageservices;

import java.io.IOException;

@WebServlet("/deleteMovies")
public class deleteMovies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public deleteMovies() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the movie ID from the request
		String movieId = request.getParameter("movieId");
	    System.out.println("Received movieId: " + movieId); // Debugging log


	    if (movieId != null && !movieId.isEmpty()) {
	        try {
	            filmpageservices service = new filmpageservices();
	            boolean isDeleted = service.deleteMovieById(Integer.parseInt(movieId));

	            if (isDeleted) {
	                // Redirect back to manageMovies.jsp with success status
	                response.sendRedirect("manageMovies.jsp?status=success");
	            } else {
	                // Redirect with error status
	                response.sendRedirect("manageMovies.jsp?status=error");
	            }
	        } catch (Exception e) {
	            e.printStackTrace(); // Log any exceptions
	            response.sendRedirect("manageMovies.jsp?status=error");
	        }
	    } else {
	        // Handle invalid movieId
	        response.sendRedirect("manageMovies.jsp?status=invalid");
	    }

	}
}
