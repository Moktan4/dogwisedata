package com.msis.dogwiseproject.backend;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;

import com.msis.dogwiseproject.model.VolunteerModel;

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
	 public static ArrayList<VolunteerModel> getAllData() {
	    	conn = MyJDBCConnection.getConnection();
	        ArrayList<VolunteerModel> volunteerList = new ArrayList<VolunteerModel>();
	        try {
	            Statement statement = conn.createStatement();
	            ResultSet request = statement.executeQuery("select * from dogwisedata");
	        
	            while(request.next()) {	
	            	VolunteerModel dwd=new VolunteerModel();
	            	String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
	        		String forward = "";
	        		dwd.setFullname(request.getString("fullname")!=null?request.getString("fullname"):"");
	        		dwd.setDatetimepicker(timeStamp);
	        		dwd.setPotty((request.getString("potty")!=null?request.getString("potty"):""));
	        		dwd.setExercise((request.getString("exercise")!=null?request.getString("exercise"):""));
	        		dwd.setTraining((request.getString("training")!=null?request.getString("training"):""));
	        		dwd.setTimeLength((request.getString("timeLength"))!=null? (request.getString("timeLength")):"");
	        		dwd.setParkPlay(request.getString("parkPlay")!=null?request.getString(("parkPlay")):"");
	        		dwd.setFetch(request.getString(("fetch"))!=null?request.getString(("fetch")):"");
	        		dwd.setTug(request.getString("tug")!=null?request.getString("tug"):"");
	        		dwd.setPlayGroups(request.getString("playGroups")!=null?request.getString("playGroups"):"");
	        		dwd.setTimeLength1(request.getString("timeLength1")!=""?(request.getString("timeLength1")):"");
	        		dwd.setInroom(request.getString("inroom")!=null?request.getString("inroom"):"");
	        		dwd.setOutsideroom(request.getString("outsideroom")!=null?request.getString("outsideroom"):"");
	        		dwd.setTimeLength2(request.getString("timeLength2")!=""?(request.getString("timeLength2")):"");
	        		dwd.setSit(request.getString("sit")!=null?request.getString("sit"):"");
	        		dwd.setDown(request.getString("down")!=null?request.getString("down"):"");
	        		dwd.setStand(request.getString("stand")!=null?request.getString("stand"):"");
	        		dwd.setWatch(request.getString("watch")!=null?request.getString("watch"):"");
	        		dwd.setPeoplefoodgood(request.getString("peoplefoodgood")!=null?request.getString("peoplefoodgood"):"");
	        		dwd.setPolitegreeting(request.getString("politegreeting")!=null?request.getString("politegreeting"):"");
	        		dwd.setStaySettle(request.getString("staySettle")!=null?request.getString("staySettle"):"");
	        		dwd.setLeavetakethanks(request.getString("leavetakethanks")!=null?request.getString("leavetakethanks"):"");
	        		dwd.setKongtraining(request.getString("kongtraining")!=null?request.getString("kongtraining"):"");
	        		dwd.setCratetraining(request.getString("cratetraining")!=null?request.getString("cratetraining"):"");
	        		dwd.setOther(request.getString("other")!=null?request.getString("other"):"");
	        		dwd.setOtherInfo(request.getString("otherInfo")!=null?request.getString("otherInfo"):"");
	        		dwd.setParagraph_text(request.getString("paragraph_text")!=null?request.getString("paragraph_text"):"");
	        		dwd.setSuccesses(request.getString("successes")!=null?request.getString("successes"):"");
	        		dwd.setChallenges(request.getString("challenges")!=null?request.getString("challenges"):"");
	        		volunteerList.add(dwd);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return volunteerList;
	    }
	
	
}
