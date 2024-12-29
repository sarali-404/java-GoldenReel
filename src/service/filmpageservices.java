package services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.movie;

import util.DBConnect;

public class filmpageservices {

    public List<movie> getAllMovies() {
        List<movie> movies = new ArrayList<>();
        String query = "SELECT * FROM movies";

        try (Connection con = DBConnect.getConnection(); PreparedStatement stmt = con.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                movie movie = new movie();
                movie.setMovieId(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setFormat(rs.getString("format"));
                movie.setLanguage(rs.getString("language"));
                movie.setDescription(rs.getString("description"));
                movie.setImageUrl(rs.getString("image_url"));
                movie.setTrailerUrl(rs.getString("trailer_url"));
                movie.setStatus(rs.getString("status"));
                movie.setPrice(rs.getDouble("price"));
                movies.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }
    
    
    

    public movie getMovieById(int movieId) {
        movie movie = null;
        String query = "SELECT * FROM movies WHERE movie_id = ?";

        try (Connection con = DBConnect.getConnection(); PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, movieId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    movie = new movie();
                    movie.setMovieId(rs.getInt("movie_id"));
                    movie.setTitle(rs.getString("title"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setFormat(rs.getString("format"));
                    movie.setLanguage(rs.getString("language"));
                    movie.setDescription(rs.getString("description"));
                    movie.setImageUrl(rs.getString("image_url"));
                    movie.setTrailerUrl(rs.getString("trailer_url"));
                    movie.setStatus(rs.getString("status"));
                    movie.setPrice(rs.getDouble("price"));
                    movie.setDuration(rs.getString("duration"));
                    movie.setReleaseDate(rs.getString("release_date"));
                    movie.setCast(rs.getString("cast"));
                   
                    

                    // Fetching showtimes as a JSON array
                    String showtimesJson = getShowtimesByMovieId(movieId);
                    movie.setShowtimes(showtimesJson); // Set the showtimes as a JSON string
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }
    
    
    

    
    
    
    
    
    private String getShowtimesByMovieId(int movieId) {
        String showtimesJson = "[]"; // Default to an empty array if no showtimes found
        String query = "SELECT showtimes FROM showtime WHERE movie_id = ?";
        try (Connection con = DBConnect.getConnection(); PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, movieId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    showtimesJson = rs.getString("showtimes");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return showtimesJson;
    }
    
    
    // Method to delete a movie by ID-Admin related
    public boolean deleteMovieById(int movieId) throws ClassNotFoundException {
    	 boolean rowDeleted = false;
    	    String sql = "DELETE FROM movies WHERE movie_id = ?"; // Deleting the movie will cascade to showtime

    	    try (Connection conn = DBConnect.getConnection();
    	         PreparedStatement stmt = conn.prepareStatement(sql)) {

    	        stmt.setInt(1, movieId); // Set movie ID
    	        System.out.println("Rows affected: " + rowDeleted); // Debugging log
    	        rowDeleted = stmt.executeUpdate() > 0; // Execute delete

    	    } catch (SQLException e) {
    	        e.printStackTrace(); // Log exception for debugging
    	    }

    	    return rowDeleted;
    }
    
 // Method to delete a showtime by ID-Admin related
    public boolean deleteShowtimeById(int showtimeId) throws ClassNotFoundException {
        String sql = "DELETE FROM showtime WHERE showtime_id = ?";
        try (Connection conn = DBConnect.getConnection();
   	         PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, showtimeId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    

}
