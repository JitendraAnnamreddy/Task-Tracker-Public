package com.taskTracker.login;

import com.jithu.db.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out =response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		AuthUser auth = new AuthUser();
		
		if(auth.verifyUser(username, password))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("./TaskTrackerPages/dashboard.jsp");
		}
		else {
			request.setAttribute("errorMessage", "Login failed please check username/password");
		      RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
		      rd.forward(request, response);
		}
		
		out.println("Welcome to login servlet");
		out.println(username);
		out.println(password);
		
		
	}

}
