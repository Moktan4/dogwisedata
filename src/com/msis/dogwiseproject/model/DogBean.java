package com.msis.dogwiseproject.model;

import java.io.File;

public class DogBean {
	
	private int dogID;
	private String dogName;
	private String roomNumber;
	private String dogStatus;
	private String uploadFile;
	
	

	public int getDogID() {
		return dogID;
	}
	public void setDogID(int dogID) {
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
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	@Override
	public String toString() {
		return "DogBean [dogID=" + dogID + ", dogName=" + dogName + ", roomNumber=" + roomNumber + ", dogStatus="
				+ dogStatus + ", uploadFile=" + uploadFile + "]";
	}
	

}
