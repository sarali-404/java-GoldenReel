package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBConnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONArray;


@WebServlet("/addShowtime")
public class addShowtime extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public addShowtime() {
        super();
 
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Set response content type
        response.setContentType("text/html");

        // Get form parameters
        String movieId = request.getParameter("movieId");
        String showtimes = request.getParameter("showtimes");

        // Validate inputs
        if (movieId == null || movieId.isEmpty() || showtimes == null || showtimes.isEmpty()) {
            response.sendRedirect("addshowtime.html?status=invalid&message=Missing+required+fields");
            return;
        }

        try {
            // Split the showtimes by comma and create a JSON array
            String[] showtimeArray = showtimes.split(",");
            JSONArray jsonShowtimes = new JSONArray();
            for (String showtime : showtimeArray) {
                jsonShowtimes.put(showtime.trim());  // Add each showtime to the JSON array
            }

            // Insert the showtime into the database
            try (Connection connection = DBConnect.getConnection()) {
                String sql = "INSERT INTO showtime (movie_id, showtimes) VALUES (?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, Integer.parseInt(movieId));
                    preparedStatement.setString(2, jsonShowtimes.toString());  // Store the JSON array as a string

                    int rowsInserted = preparedStatement.executeUpdate();
                    if (rowsInserted > 0) {
                        response.sendRedirect("manageShowtimes.jsp?status=success");
                    } else {
                        response.sendRedirect("addshowtime.html?status=error&message=Failed+to+add+showtime");
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("addshowtime.html?status=error&message=" + e.getMessage());
        }
	}

}
