package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.movie;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/addMovie")
public class addMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public addMovie() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Set response content type
        response.setContentType("text/html");

        // Get movie details from the form
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String format = request.getParameter("format");
        String language = request.getParameter("language");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");
        String trailerUrl = request.getParameter("trailerUrl");
        String status = request.getParameter("status");
        double price = Double.parseDouble(request.getParameter("price"));
        String duration = request.getParameter("duration");
        String releaseDate = request.getParameter("releaseDate");
        String cast = request.getParameter("cast");

        // Create a Movie object with the retrieved data
        movie newMovie = new movie(0, title, genre, format, language, description, imageUrl, trailerUrl, status, price, duration, releaseDate, cast, "");

        // Database connection variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establish the database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_db", "root", ""); 
            String sql = "INSERT INTO movies (title, genre, format, language, description, image_url, trailer_url, status, price, duration, release_date, cast) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newMovie.getTitle());
            pstmt.setString(2, newMovie.getGenre());
            pstmt.setString(3, newMovie.getFormat());
            pstmt.setString(4, newMovie.getLanguage());
            pstmt.setString(5, newMovie.getDescription());
            pstmt.setString(6, newMovie.getImageUrl());
            pstmt.setString(7, newMovie.getTrailerUrl());
            pstmt.setString(8, newMovie.getStatus());
            pstmt.setDouble(9, newMovie.getPrice());
            pstmt.setString(10, newMovie.getDuration());
            pstmt.setString(11, newMovie.getReleaseDate());
            pstmt.setString(12, newMovie.getCast());

          
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Movie added successfully, redirect to success page
                response.sendRedirect("manageMovies.jsp?status=success");
            } else {
                // Something went wrong, redirect to failure page
                response.sendRedirect("manageMovies.html?status=failure");
            }
        } catch (SQLException e) {
           
            e.printStackTrace();
            response.sendRedirect("manageMovies.html?status=error");
        } finally {
           
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

	}


