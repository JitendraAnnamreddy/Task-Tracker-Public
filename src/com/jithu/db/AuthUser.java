package com.jithu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthUser {
	
	
	public boolean verifyFirstUser(String username) 
	{
		DataBaseOps obj = new DataBaseOps();
		Connection con = obj.connectToDB();
		
		if(con==null)
		{
			return false;
		}
		else {
			
		    System.out.println("database Connected.......");
		    
			String query = "select * from public.\"userTable\" WHERE username=?";
			try {
				
				PreparedStatement stmt =null;
				stmt= con.prepareStatement(query);
				stmt.setString(1,username);
				
				ResultSet rs = stmt.executeQuery();
				con.close();
				
				if(rs.next())
				{
					return false;
				}
				else {
					return true;
				}
				
				
			}catch(SQLException e)
			{
				System.out.println(e);
			}
			
		}
		
		
		return false;
	}
	
	
	
	
	public boolean verifyUser(String username,String password) 
	{
		DataBaseOps obj = new DataBaseOps();
		Connection con = obj.connectToDB();
		
		if(con==null)
		{
			return false;
		}
		else {
			
		    System.out.println("database Connected.......");
		    
			String query = "select * from public.\"userTable\" WHERE username=? and password=?";
			try {
				
				PreparedStatement stmt =null;
				stmt= con.prepareStatement(query);
				stmt.setString(1,username);
				stmt.setString(2,password);
				ResultSet rs = stmt.executeQuery();
				con.close();
				
				if(rs.next())
				{
					return true;
				}
				else {
					return false;
				}
				
				
			}catch(SQLException e)
			{
				System.out.println(e);
			}
			
		}
		
		
		return false;
	}
	

}
