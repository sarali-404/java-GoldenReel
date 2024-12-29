package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.MovieService;
import model.movie;
import java.io.IOException;
import java.util.List;


@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public HomeServlet() {
        super();
       
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	MovieService movieService = new MovieService();
        List<movie> nowShowingMovies = movieService.getMoviesByStatus("Now Showing");
        List<movie> comingSoonMovies = movieService.getMoviesByStatus("Coming Soon");

        // Set attributes for JSP
        request.setAttribute("nowShowingMovies", nowShowingMovies);
        request.setAttribute("comingSoonMovies", comingSoonMovies);


        // Forward to the home.jsp after setting the attributes
        request.getRequestDispatcher("home.jsp").forward(request, response);

      }


}
