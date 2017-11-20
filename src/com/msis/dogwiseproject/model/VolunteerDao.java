package com.msis.dogwiseproject.model;

import java.sql.Connection;
import java.sql.SQLException;

import com.msis.dogwiseproject.backend.MyJDBCConnection;

public class VolunteerDao {
	private Connection dbConnection;
	
	public VolunteerDao() {
		dbConnection = MyJDBCConnection.getConnection();
	}
	
	public void save(VolunteerModel volunteer) {
		try {
			java.sql.PreparedStatement prepStatement = dbConnection.prepareStatement("insert into dogwisedata(fullname,datetimepicker, potty, exercise, training, timeLength, parkPlay, fetchs, tug, playGroups, timeLength1, inroom, outsideroom, timeLength2, sit, down, stand, watch, peoplefoodgood, politegreeting, staySettle, leavetakethanks, kongtraining, cratetraining, other, otherInfo, paragraph_text, successes, challenges) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			prepStatement.setString(1, volunteer.getFullname());
			prepStatement.setString(2, (volunteer.getDatetimepicker()));
			prepStatement.setString(3,(volunteer.getPotty()));
			prepStatement.setString(4, (volunteer.getExercise()));
			prepStatement.setString(5, (volunteer.getTraining()));
			
				prepStatement.setString(6, (volunteer.getTimeLength()));
			
			prepStatement.setString(7, (volunteer.getParkPlay()));
			prepStatement.setString(8, (volunteer.getFetch()));
			prepStatement.setString(9, (volunteer.getTug()));
			prepStatement.setString(10, (volunteer.getPlayGroups()));
			
				prepStatement.setString(11, (volunteer.getTimeLength1()));
			
			prepStatement.setString(12, (volunteer.getInroom()));
			prepStatement.setString(13, (volunteer.getOutsideroom()));
			
				prepStatement.setString(14,(volunteer.getTimeLength2()));
			
			prepStatement.setString(15, (volunteer.getSit()));
			prepStatement.setString(16, (volunteer.getDown()));
			prepStatement.setString(17, (volunteer.getStand()));
			prepStatement.setString(18,volunteer.getWatch());
			prepStatement.setString(19,volunteer.getPeoplefoodgood());
			prepStatement.setString(20,volunteer.getPolitegreeting());
			prepStatement.setString(21,volunteer.getStaySettle());
			prepStatement.setString(22,volunteer.getLeavetakethanks());
			prepStatement.setString(23,volunteer.getKongtraining());
			prepStatement.setString(24,volunteer.getCratetraining());
			prepStatement.setString(25,volunteer.getOther());
			prepStatement.setString(26,volunteer.getOtherInfo());
			prepStatement.setString(27,volunteer.getParagraph_text());
			prepStatement.setString(28,volunteer.getSuccesses());
			prepStatement.setString(29,volunteer.getChallenges());
			prepStatement.execute();
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