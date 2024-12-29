package services;

import java.sql.ResultSet;
import java.sql.Statement;

import model.feedback;
import model.user;

import util.DBConnect;

public class userService {
	
	public void regUser(user u) {
		try {
			
			String query = "INSERT INTO users (name, username, password, email, created_at) " +
                    "VALUES ('" + u.getName() + "', '" + u.getUsername() + "', '" + u.getPassword() + "', '" + u.getEmail() + "', NOW())";

     
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean validate(user u) {
		try {
			
			String query = " select * from users where  username = '"+ u.getUsername()+"' and password = '"+ u.getPassword()+"' ";
			
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return false;
	}
	
	
	
	

}
