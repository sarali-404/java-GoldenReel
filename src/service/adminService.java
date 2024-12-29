package services;

import java.sql.ResultSet;
import java.sql.Statement;

import model.admin;
import util.DBConnect;

public class adminService {
	
	public boolean validateAdmin(admin admin1) {
		try {
			
			String query = " select * from admin where  username = '"+ admin1.getUsername()+"' and password = '"+ admin1.getPassword()+"' ";
			
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
