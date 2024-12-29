package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.filmpageservices;
import model.movie;

@WebServlet("/Filmpageservlet")
public class Filmpageservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private filmpageservices service;

    @Override
    public void init() {
        service = new filmpageservices();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String movieIdParam = request.getParameter("movieId");
        if (movieIdParam != null) {
            int movieId = Integer.parseInt(movieIdParam);
            movie movie = service.getMovieById(movieId);
            if (movie != null) {
                request.setAttribute("title", movie.getTitle());
                request.setAttribute("duration", movie.getDuration());
                request.setAttribute("releaseDate", movie.getReleaseDate());
                request.setAttribute("language", movie.getLanguage());
                request.setAttribute("cast", movie.getCast());
                request.setAttribute("type", movie.getGenre());
                request.setAttribute("description", movie.getDescription());
                request.setAttribute("image_url", movie.getImageUrl());
                request.setAttribute("price", movie.getPrice());
                request.setAttribute("movieFormat", movie.getFormat());
                request.setAttribute("showtimes", movie.getShowtimes());  // Set showtimes as a JSON string
                request.getRequestDispatcher("filmpage.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }

   
}
