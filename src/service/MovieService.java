package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.movie;
import util.DBConnect;

public class MovieService {
 
	public List<movie> getMoviesByStatus(String status) {
	    List<movie> movies = new ArrayList<>();
	    try {
	        Connection conn = DBConnect.getConnection();
	        String query = "SELECT * FROM movies WHERE status = '" + status + "'";

	        Statement stmt = conn.createStatement();
	        ResultSet rs = stmt.executeQuery(query);

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
	            movies.add(movie);
	        }

	        // Add this line to debug and check the number of movies found
	        System.out.println("Number of movies found: " + movies.size());

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return movies;
	}

}
