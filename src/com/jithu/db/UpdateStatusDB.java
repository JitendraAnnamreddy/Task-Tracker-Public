package com.jithu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateStatusDB {
	public boolean updateTaskStatus(String taskid, String status) {
		DataBaseOps db = new DataBaseOps();
		Connection con = db.connectToDB();
		if (con == null) {
			return false;
		} else {
			String statement = "UPDATE public.\"taskTable\" SET status=? WHERE taskid=?;";
			try {
				PreparedStatement query = con.prepareStatement(statement);
				query.setString(1, status);
				query.setInt(2, Integer.parseInt(taskid));
				int result = query.executeUpdate();
				query.close();

				con.close();

				if (result == 1) {
					return true;
				} else {
					return false;
				}
			} catch (SQLException e) {
				System.out.print(e.getMessage());
				return false;
			}
		}

	}

}
