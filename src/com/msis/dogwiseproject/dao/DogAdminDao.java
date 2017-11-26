package com.msis.dogwiseproject.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.msis.dogwiseproject.backend.MyJDBCConnection;
import com.msis.dogwiseproject.model.DogBean;

public class DogAdminDao {
	
private Connection dbConnection;
	
	public DogAdminDao() {
		dbConnection = MyJDBCConnection.getConnection();
	}
	public void save(DogBean dogBean) {
		try{
			
			
			java.sql.PreparedStatement prepStatement = dbConnection.prepareStatement("insert into doglist(dogID, dogName, roomNumber, dogStatus, uploadFile) values (?, ?, ?, ?,?)");
			prepStatement.setInt(1, dogBean.getDogID());
			prepStatement.setString(2, dogBean.getDogName());
			prepStatement.setString(3, dogBean.getRoomNumber());
			prepStatement.setString(4, dogBean.getDogStatus());
			prepStatement.setString(5, dogBean.getUploadFile());
			prepStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	
		
	}
	public void delete(int dogID) {
		try {
			java.sql.PreparedStatement prepStatement = dbConnection.prepareStatement("Delete FROM doglist where dogID=?");
			prepStatement.setInt(1, dogID);
			prepStatement.executeUpdate();
	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<DogBean> getAllDogs() {
        List<DogBean> dbs = new ArrayList<DogBean>();
        try {
        	java.sql.PreparedStatement statement = dbConnection.prepareStatement("select * from doglist");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                DogBean db = new DogBean();
                db.setDogID(rs.getInt("dogID"));
                db.setDogName(rs.getString("dogName"));
                db.setRoomNumber(rs.getString("roomNumber"));
                db.setDogStatus(rs.getString("dogStatus"));
                db.setUploadFile(rs.getString("uploadFile"));
                dbs.add(db);

            }
     
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dbs;
    }

}
