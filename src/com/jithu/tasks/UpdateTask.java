package com.jithu.tasks;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jithu.db.UpdateStatusDB;

@WebServlet("/updatetask")
public class UpdateTask extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskid = request.getParameter("taskid");
		String status = request.getParameter("status");
		String tabName = request.getParameter("tabName");
		UpdateStatusDB usdb = new UpdateStatusDB();
		usdb.updateTaskStatus(taskid, status);
		response.sendRedirect("./tasktrackerPages/" + tabName);
	}

}