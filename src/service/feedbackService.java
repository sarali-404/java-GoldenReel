package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.feedback;
import util.DBConnect;

public class feedbackService {
		
	  public List<feedback> getAllFeedback() throws ClassNotFoundException {
	        List<feedback> feedbackList = new ArrayList<>();
	        String query = "SELECT * FROM feedback"; // Assuming 'feedback' is the table name
	        
	        try (Connection con = DBConnect.getConnection(); 
	             Statement stmt = con.createStatement(); 
	             ResultSet rs = stmt.executeQuery(query))
	        {
	        	if (rs != null) {
	        	    System.out.println("Query executed successfully");
	        	}

	            while (rs.next()) {
	                feedback fb = new feedback();
	                fb.setFeedback_id(rs.getInt("feedback_id"));
	                fb.setName(rs.getString("name"));
	                fb.setEmail(rs.getString("email"));
	                fb.setRating(rs.getString("rating"));
	                fb.setFeedback_text(rs.getString("feedback_text"));
	                feedbackList.add(fb);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return feedbackList;
	    }
	  
	// Method to save feedback into the database
	    public void saveFeedback(feedback fb) {
	        try {
	        	String query = "INSERT INTO feedback (name, email, rating, feedback_text) " +
	                    "VALUES ('" + fb.getName() + "', '" + fb.getEmail() + "', '" + fb.getRating() + "', '" + fb.getFeedback_text() + "')";

	            Statement statement = DBConnect.getConnection().createStatement();
				statement.executeUpdate(query);
	            
	           
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	         
	    }
	
}
