package com.msis.dogwiseproject.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.msis.dogwiseproject.backend.MyJDBCConnection;

public class AdminLoginDAO {
	public static boolean validate(String name, String pass){
		
		
		boolean status=false;
		java.sql.PreparedStatement st=null;
		ResultSet rs=null;
		try {
			st=MyJDBCConnection.getConnection().prepareStatement("select * from admin where username=? and  password=?");
			st.setString(1, name);
			st.setString(2, pass);
			
			rs=st.executeQuery();
			status=rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}

}
