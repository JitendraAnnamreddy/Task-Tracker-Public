package com.jithu.tasks;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jithu.db.FetchCompletedTasks;

/**
 * Servlet implementation class FetchCompletedTask
 */
@WebServlet("/fetchcompletedtask")
public class FetchCompletedTask extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FetchCompletedTasks fctdb = new FetchCompletedTasks();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		out.print(fctdb.fetchtasks(session.getAttribute("username").toString()));
	}

}