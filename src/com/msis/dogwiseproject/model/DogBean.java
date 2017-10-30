package com.msis.dogwiseproject.model;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.Part;

import com.msis.dogwiseproject.backend.MyJDBCConnection;

public class DogBean {
	
	private String dogID;
	private String dogName;
	private String roomNumber;
	private String dogStatus;
	private File uploadFile;
	
	
	public String getDogID() {
		return dogID;
	}
	public void setDogID(String dogID) {
		this.dogID = dogID;
	}
	public String getDogName() {
		return dogName;
	}
	public void setDogName(String dogName) {
		this.dogName = dogName;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getDogStatus() {
		return dogStatus;
	}
	public void setDogStatus(String dogStatus) {
		this.dogStatus = dogStatus;
	}
	
	
	/*public void save(String dogID2, String dogName2, String roomNumber2, String dogStatus2) {
		// TODO Auto-generated method stub
		
	}*/

public File getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}


private Connection dbConnection;
	
	public DogBean() {
		dbConnection = MyJDBCConnection.getConnection();
	}
	
	public void save(String dogID, String dogName, String roomNumber, String dogStatus, String uploadFile) {
		try {
			java.sql.PreparedStatement prepStatement = dbConnection.prepareStatement("insert into doglist(dogID, dogName, roomNumber, dogStatus, uploadFile) values (?, ?, ?, ?,?)");
			prepStatement.setString(1, dogID);
			prepStatement.setString(2, dogName);
			prepStatement.setString(3, roomNumber);
			prepStatement.setString(4, dogStatus);
			prepStatement.setString(5, uploadFile);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	/*	ALTER TABLE `GSW`.`doglist` 
		CHANGE COLUMN `ID` `dogID` VARCHAR(45) NOT NULL ,
		CHANGE COLUMN `Name` `dogName` VARCHAR(45) NULL DEFAULT NULL ,
		CHANGE COLUMN `Room/Suit#` `roomNumber` VARCHAR(45) NULL DEFAULT NULL ,
		ADD COLUMN `dogStatus` VARCHAR(45) NULL AFTER `roomNumber`;*/


//	private byte[] getByteArrayFromFile(final Part uploadFile) throws IOException {
//		final ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		final InputStream in = new FileInputStream(uploadFile);
//		final byte[] buffer = new byte[500];
//		int read = -1;
//		while ((read = in.read(buffer)) > 0) {
//		    baos.write(buffer, 0, read);
//		}
//		in.close();
//		return baos.toByteArray();
//		}
	

}
