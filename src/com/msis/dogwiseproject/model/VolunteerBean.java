package com.msis.dogwiseproject.model;

import java.sql.Connection;
import java.sql.SQLException;

import com.msis.dogwiseproject.backend.MyJDBCConnection;

public class VolunteerBean {
	private Connection dbConnection;
	
	public VolunteerBean() {
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
	public static String toStringYesNo(boolean bool) {
	      return toString(bool, "yes", "no");
	  }
	 public static String toString(boolean bool, String trueString, String falseString) {
	      return bool ? trueString : falseString;
	  }
}