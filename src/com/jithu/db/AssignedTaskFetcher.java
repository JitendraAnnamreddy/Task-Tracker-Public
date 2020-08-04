package com.jithu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AssignedTaskFetcher {
	public String fetchtasks(String username) {
		DataBaseOps db = new DataBaseOps();
		Connection con = db.connectToDB();
		if (con == null) {
			return null;
		} else {
			String statement = "select * from public.\"taskTable\" where (assignedby=? and status!='Completed') order by taskid DESC;";
			try {
				PreparedStatement query = con.prepareStatement(statement);
				query.setString(1, username);
				ResultSet result = query.executeQuery();

				// query.close();

				con.close();
				String reqHTML = "";
				if (result == null) {

					return "";
				} else {
					while (result.next()) {

						String status = result.getString(5);
						String taskid = "" + result.getInt(1);
						String taskDes = result.getString(4);
						String assignedBy = result.getString(2);
						String color = "";
						if (status.equals("Pending")) {
							color = " text-white bg-primary ";
						} else if (status.equals("Stuck")) {
							color = " text-white bg-warning ";
						} else if (status.equals("Completed")) {
							color = " text-white bg-success ";
						} else if (status.equals("Reject")) {
							color = " text-white bg-danger ";
						}
						reqHTML += "<div class=\"card" + color + "\">\r\n" + "		<div class=\"card-body\">\r\n"
								+ "		\r\n" + "			<h3 class=\"card-title\">\r\n" + "				" + status
								+ "\r\n" + "			</h3>\r\n" + "			<h5 class=\"card-subtitle \">\r\n"
								+ "				" + "Assigned to: " + assignedBy + "\r\n" + "			</h5>\r\n"
								+ "			<p>\r\n" + "			" + taskDes + "\r\n" + "			</p>\r\n"
								+ "			<div class=\"container container-md \" >\r\n"
								+ "						<button type=\"button\" class=\"btn btn-light btn-md  \" data-toggle=\"modal\" data-target=\"#"
								+ 'a' + taskid + "\">\r\n" + "							Update\r\n"
								+ "						</button>\r\n" + "					</div>\r\n"
								+ "			<div class=\"container\">\r\n"
								+ "				<div class=\"modal modal-md fade modal-dialog-md \" id=\"" + 'a'
								+ taskid + "\" role=\"dialog\" tabindex=\"-1\" >\r\n"
								+ "					<div class=\"modal-dialog modal-dialog-centered\">\r\n"
								+ "						<div class=\"modal-content\">\r\n"
								+ "			  				<div class=\"card shadow\">\r\n"
								+ "  								<div class=\"card-body\">\r\n"
								+ "  									<form method=\"post\">\r\n"
								+ "						  				<div class=\"form-group\">\r\n"
								+ "						  					<label style=\"color:black\">Task Status"
								+ "" + "</label>\r\n"
								+ "						  					<select class=\"form-contorl\" name=\"status\">\r\n"
								+ "						  						<option>Pending</option>\r\n"
								+ "						  						<option>Stuck</option>\r\n"
								+ "						  						<option>Completed</option>\r\n"
								+ "						  						<option>Reject</option>\r\n"
								+ "						  					</select>\r\n"
								+ "						  				</div>\r\n"
								+ "						  				<input type=\"hidden\" name=\"taskid\" value=\""
								+ taskid + "\">\r\n"+ "<input type=\"hidden\" name=\"tabName\" value=\""
										+ "Assigned.jsp" + "\">\r\n"
								+ "						  				<button type=\"submit\" class=\"btn btn-primary\" formaction=\"../updatetask\">Update</button>\r\n"
								+ "						  				<button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>\r\n"
								+ "									</form><br>\r\n"
								+ "  								</div>\r\n"
								+ "  							</div>\r\n" + "						</div>\r\n"
								+ "					</div>\r\n" + "				</div>\r\n" + "			</div>\r\n"
								+ "			</div>\r\n" + "	</div>\r\n" + "	<br>";

					}
					return reqHTML;
				}
			} catch (SQLException e) {

				return e.getMessage();
			}
		}

	}

}
