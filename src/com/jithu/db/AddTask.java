package com.jithu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddTask {
	public boolean addTaskToDB(String Desc, String assignedBy, String assignedTo) {
		DataBaseOps db = new DataBaseOps();
		Connection con = db.connectToDB();
		if (con == null) {
			return false;
		} else {
			String statement = "INSERT INTO public.\"taskTable\" (assignedto,assignedby,taskdesc,status) VALUES (?,?,?,?);";
			try {
				PreparedStatement query = con.prepareStatement(statement);
				query.setString(1, assignedTo);
				query.setString(2, assignedBy);
				query.setString(3, Desc);
				query.setString(4, "Pending");
				int result = query.executeUpdate();

				query.close();

				con.close();

				if (result == 1) {
					return true;
				} else {
					return false;
				}
			} catch (SQLException e) {

				return false;
			}
		}

	}

}