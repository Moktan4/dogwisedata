package com.msis.dogwiseproject.model;

import java.sql.Connection;
import java.sql.SQLException;

import com.msis.dogwiseproject.backend.MyJDBCConnection;

public class VolunteerDao {
	private Connection dbConnection;
	
	public VolunteerDao() {
		dbConnection = MyJDBCConnection.getConnection();
	}
	
	public void save(String datetimepicker, boolean potty, boolean exercise, boolean training) {
		try {
			java.sql.PreparedStatement prepStatement = dbConnection.prepareStatement("insert into dogwisedata(datetimepicker, potty, exercise, training) values (?, ?, ?, ?)");
			prepStatement.setString(1, datetimepicker);
			prepStatement.setString(2,"potty"!=null?"yes":"no");
			prepStatement.setString(3, "exercise"!=null?"yes":"no");
			prepStatement.setString(4, "training"!=null?"yes":"no");
			prepStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	public void select(int dogID) {
		try {
			java.sql.PreparedStatement prepStatement = dbConnection.prepareStatement("Select * FROM doglist where dogID=?");
			prepStatement.setInt(1, dogID);
			prepStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}