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
			java.sql.PreparedStatement prepStatement = dbConnection.prepareStatement("insert into dogwisedata(dogidentify,fullname,datetimepicker, potty, exercise, training, timeLength, parkPlay, fetchs, tug, playGroups, timeLength1, inroom, outsideroom, timeLength2, sit, down, stand, watch, peoplefoodgood, politegreeting, staySettle, leavetakethanks, kongtraining, cratetraining, other, otherInfo, paragraph_text, successes, challenges) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
			prepStatement.setString(1, volunteer.getDogIdentification());
			prepStatement.setString(2, volunteer.getFullname());
			prepStatement.setString(3, (volunteer.getDatetimepicker()));
			prepStatement.setString(4,(volunteer.getPotty()));
			prepStatement.setString(5, (volunteer.getExercise()));
			prepStatement.setString(6, (volunteer.getTraining()));
			
				prepStatement.setString(7, (volunteer.getTimeLength()));
			
			prepStatement.setString(8, (volunteer.getParkPlay()));
			prepStatement.setString(9, (volunteer.getFetch()));
			prepStatement.setString(10, (volunteer.getTug()));
			prepStatement.setString(11, (volunteer.getPlayGroups()));
			
				prepStatement.setString(12, (volunteer.getTimeLength1()));
			
			prepStatement.setString(13, (volunteer.getInroom()));
			prepStatement.setString(14, (volunteer.getOutsideroom()));
			
				prepStatement.setString(15,(volunteer.getTimeLength2()));
			
			prepStatement.setString(16, (volunteer.getSit()));
			prepStatement.setString(17, (volunteer.getDown()));
			prepStatement.setString(18, (volunteer.getStand()));
			prepStatement.setString(19,volunteer.getWatch());
			prepStatement.setString(20,volunteer.getPeoplefoodgood());
			prepStatement.setString(21,volunteer.getPolitegreeting());
			prepStatement.setString(22,volunteer.getStaySettle());
			prepStatement.setString(23,volunteer.getLeavetakethanks());
			prepStatement.setString(24,volunteer.getKongtraining());
			prepStatement.setString(25,volunteer.getCratetraining());
			prepStatement.setString(26,volunteer.getOther());
			prepStatement.setString(27,volunteer.getOtherInfo());
			prepStatement.setString(28,volunteer.getParagraph_text());
			prepStatement.setString(29,volunteer.getSuccesses());
			prepStatement.setString(30,volunteer.getChallenges());
			
			prepStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public void select(String dogID) {
		try {
			java.sql.PreparedStatement prepStatement = dbConnection.prepareStatement("Select * FROM doglist where dogID=?");
			prepStatement.setString(1, dogID);
			prepStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}