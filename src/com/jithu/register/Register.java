package com.jithu.register;
import com.jithu.db.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		AuthUser auth = new AuthUser();
		if(auth.verifyFirstUser(username))
		{
			DataBaseOps obj = new DataBaseOps();
			Connection c = obj.connectToDB();
			
			String query = "INSERT INTO public.\"userTable\"(username,password) values(?,?)";
			try {
				PreparedStatement stmt = c.prepareStatement(query);
				stmt.setString(1, username);
				stmt.setString(2,password);
				int i = stmt.executeUpdate();
				request.setAttribute("successmessage", "You Have aSuccess fully Registered.");
				c.close();
				RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
			      rd.forward(request, response);
			}catch(SQLException e)
			{
				System.out.println(e);
			}
			
		}else {
			
			request.setAttribute("duplicateUsererrorMessage", "Username Already Exists");
			RequestDispatcher rd = request.getRequestDispatcher("./register.jsp");
		      rd.forward(request, response);
		}
		
		
	}

}
