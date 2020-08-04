package com.jithu.tasks;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jithu.db.MyTaskFetcher;

/**
 * Servlet implementation class FetchMyTask
 */
@WebServlet("/fetchmytask")
public class FetchMyTask extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MyTaskFetcher mtf = new MyTaskFetcher();
		out.print(mtf.fetchtasks(session.getAttribute("username").toString()));

	}

}
