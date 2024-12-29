package services;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.showtimes;
import util.DBConnect;




public class showtimeService {
	
	
	public List<showtimes> getAllShowtimes() throws ClassNotFoundException {
		 List<showtimes> showtimeList = new ArrayList<>();
	        String query = "SELECT * FROM showtime";

	        try (Connection conn = DBConnect.getConnection();
	             Statement stmt = conn.createStatement();
	             ResultSet rs = stmt.executeQuery(query)) {

	            while (rs.next()) {
	                showtimes st = new showtimes();
	                st.setShowtimeId(rs.getInt("showtime_id"));
	                st.setMovieId(rs.getInt("movie_id"));
	                st.setShowtimes(rs.getString("showtimes")); // Parse JSON for showtimes
	                showtimeList.add(st);
	            }
	        } catch (SQLException e) {
	            System.out.println("Error fetching showtimes: " + e.getMessage());
	        }
	        return showtimeList;
	}

	
	public boolean deleteShowtimeById(int showtimeId) throws ClassNotFoundException {
        boolean rowDeleted = false;
        String sql = "DELETE FROM showtime WHERE showtime_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, showtimeId); // Set showtime ID
            rowDeleted = stmt.executeUpdate() > 0; // Execute delete
            System.out.println("Rows affected: " + rowDeleted); // Debugging log

        } catch (SQLException e) {
            e.printStackTrace(); // Log exception
        }

        return rowDeleted;
    }

}
 