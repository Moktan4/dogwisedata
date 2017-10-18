package com.msis.dogwiseproject.backend;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class MyJDBCConnection {
	
	private static Connection conn=null;
	public static Connection getConnection(){
		
		if(conn!=null){
			return conn;
		}else{
			try{
				InputStream inputStream = MyJDBCConnection.class.getClassLoader().getResourceAsStream("db.properties");
				Properties prop=new Properties();
				if(prop!=null){
					prop.load(inputStream);
					String dbDriver = prop.getProperty("dbDriver");
					String connectionURL=prop.getProperty("connectionURL");
					String username=prop.getProperty("username");
					String password=prop.getProperty("password");
					
					Class.forName(dbDriver).newInstance();
					conn=DriverManager.getConnection(connectionURL,username,password);
				}
				
			}catch(Exception ex){
				System.out.println(ex.getMessage());
			}
		}
		return conn;
		
	}
}
