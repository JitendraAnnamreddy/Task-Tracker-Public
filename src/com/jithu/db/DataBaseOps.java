package com.jithu.db;

import java.sql.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class DataBaseOps {
	
	
	
   public Connection connectToDB() {
      Connection c = null;
      Statement stmt = null;
      try {
         Class.forName("org.postgresql.Driver");
         
         String host="";
         String port="";
         String db="";
         String user="";
         String pass="";
         String url = "";
                 
         c = DriverManager
            .getConnection(url,user,pass);
         System.out.println("Opened database successfully");
         
         return c;
      } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         
         return null;
      }
      
   }
}