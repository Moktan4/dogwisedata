<%@page import="com.msis.dogwiseproject.backend.MyJDBCConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Interactions Form</title>
<link rel="shortcut icon" href="/dogwisedata/assets/img/favicon.ico" />
<link href="/dogwisedata/assets/css/bootstrap-united.css"
	rel="stylesheet" />
<link href="/dogwisedata/assets/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<link href="/dogwisedata/assets/css/bootstrap-united.min.css"
	rel="stylesheet" />

<style>
label {
	color: green;
	font-weight: bold;
	padding: 2px;
	text-transform: uppercase;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
}

.navbar {
	margin-bottom: 0;
	background-color: #008080;
	z-index: 9999;
	border: 0;
	font-size: 18px !important;
	line-height: 1.42857143 !important;
	border-radius: 0;
	font-family: "Times New Roman", Times, serif;
	font-style: strong;
	color: #fff;
}

.navbar li a, .navbar .navbar-brand {
	color: #FEA900 !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #FEA900 !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="header.jsp" />
	</div>
	<div>
		<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header navbar-center">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>


			</div>


			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/dogwisedata/">Home</a></li>
					<li><a href="volunteer.jsp">View Dog</a></li>
					<li><a style="background-color: #fff" href="#">Volunteer
							Log</a></li>
				</ul>
			</div>
		</div>

		</nav>
	</div>
	<BR>
	<BR>
	<% String id = request.getParameter("id");%>
	<% java.util.Date date = new java.util.Date();%>
	<%
	
	 DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm");
    Date dateobj = new Date();
    System.out.println(df.format(dateobj));

    /*getting current date time using calendar class 
     * An Alternative of above*/
    Calendar calobj = Calendar.getInstance();
    System.out.println(df.format(calobj.getTime()));
try {

Connection conn = null;

java.sql.PreparedStatement st=null;
ResultSet rs=null;

		
st =MyJDBCConnection.getConnection().prepareStatement("SELECT * from doglist WHERE dogID="+id);

rs = st.executeQuery();

%>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr style="background-color: skyblue;">
					<th>ID</th>
					<th>Name</th>
					<th>Suite/Room#</th>
					<th>Dog Status</th>
				</tr>
			</thead>
			<% 
		while (rs.next()) {	
		%>
			<TR>
				<TD><%=rs.getString(1)%></TD>
				<TD><%=rs.getString(2)%></TD>
				<TD><%=rs.getString(3)%></TD>
				<TD><%=rs.getString(4)%></TD>
			</TR>
		</table>
	</div>
	
	<%} %>

	<%
// close all the connections.
rs.close();
st.close();
} catch (Exception ex) {
%>

	<font size="+3" color="red"></b></font>
	<%
out.println("Unable to connect to database.");
		
}
%>
	<br>
	<script src="/dogwisedata/jquery-1.8.3.js">
		
	</script>
	<div class="container">

		<form id="myForm" method="post" class="bs-example form-horizontal"
			action="../DogWiseDataController">
			<div class="form-group">
				<div>
				<label for="dogid" style="width: 292px; color: green;">Dog ID:</label>
				<input type="hidden" name="dogid" value="<%=id%>"><%=id%><br> 
					<label for="initial" style="width: 292px; color: green;">Volunteer
						Full Name:</label> <input type="text" style="width: 292px;" name="fullname"
						id="initialsInput" required> <br> <label
						for="dateAndTime" style="width: 292px; color: green;">Date
						and Time:</label><%=df.format(calobj.getTime())%> 
				</div>
				<br> <br>
				<div class="form-group">
					<h4
						style="text-align: center; font-style: strong; color: red; font-size: 20px;">Socialization
						Logs</h4>

					<label for="walkInput">Walk</label><br> 
					<input type="radio"
						name="potty" class="radio-button" value="Potty" id="pottyInput">&nbsp;&nbsp;Potty&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" class="radio-button" name="exercise"
						value="Exercise" id="exerciseInput">&nbsp;&nbsp;Exercise&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="training" class="radio-button"
						value="Training" id="trainingInput">&nbsp;&nbsp;Training&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;Length of Time:&nbsp;&nbsp; <input
						type="text" id="timelengthInput" placeholder="time in minutes"
						name="timeLength" onKeyPress="numberCheck()" style="width: 186px;"><br>
					<br> 
					<label for="playTimeInput">Play Time</label><br> <input
						type="radio" name="parkPlay" class="radio-button1" value="Park Play" id="parkPlayInput">&nbsp;&nbsp;Park
					Play&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" class="radio-button1" name="fetch"
						value="Fetch" id="fetchInput">&nbsp;&nbsp;Fetch&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" class="radio-button1" name="tug" value="Tug" id="tugInput">&nbsp;&nbsp;Tug&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio"  class="radio-button1" name="playGroups" value="Play Groups"
						id="playGroupsInput">&nbsp;&nbsp;Play
					Groups&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Length of
					Time:&nbsp;&nbsp; <input type="text" id="timelength1Input"
						placeholder="time in minutes" name="timeLength1"
						onKeyPress="numberCheck()" style="width: 186px;"><br> <br>
					<label for="quietTimeInput">Quiet Time</label><br> <input
						type="radio" class="radio-button2" name="inroom" value="In Room" id="inroomInput">&nbsp;&nbsp;In
					Room&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" class="radio-button2" name="outsideroom"
						value="Outside Room" id="outsideroomInput">&nbsp;&nbsp;Outside
					Room&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Length of
					Time:&nbsp;&nbsp;<input type="text" id="timelength2Input"
						placeholder="time in minutes" name="timeLength2"
						onKeyPress="numberCheck()" style="width: 186px;"><br> <br>
					<label for="trainingInput">Training</label><br> 
					<input
						type="checkbox"  name="sit" value="Sit" id="sitInput">&nbsp;&nbsp;sit&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox"  name="down" value="Down" id="downInput">&nbsp;&nbsp;Down&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox"  name="stand" value="Stand" id="standInput">&nbsp;&nbsp;Stand&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox"  name="watch" value="Watch" id="watchInput">&nbsp;&nbsp;Watch&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox"  name="peoplefoodgood" value="People Food Good"
						id="poplefoodgoodInput">&nbsp;&nbsp;People=Food=Good&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox"  name="politegreeting" value="Polite Greeting"
						id="politeGreetingInput">&nbsp;&nbsp;Polite
					Greeting&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" 
						name="staySettle" value="Stay Settle" id="staySettleInput">&nbsp;&nbsp;Stay/Settle&nbsp;&nbsp;&nbsp;&nbsp;
					<br> <br> <input type="checkbox"  name="leavetakethanks"
						value="Leave Take Thanks" id="leavetakethankInput">&nbsp;&nbsp;Leave
					it/take it/Thank you&nbsp;&nbsp;&nbsp; <input type="checkbox" 
						name="kongtraining" value="Kong Training" id="kongtrainingInput">&nbsp;&nbsp;Kong
					Training&nbsp;&nbsp;&nbsp; <input type="checkbox"  name="cratetraining"
						value="Crate Training" id="cratetrainingInput">&nbsp;&nbsp;Crate
					Training&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"  name="other"
						value="Other" id="otherInput">&nbsp;&nbsp;Other&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="otherInfo" id="otherInfoInput"
						placeholder="other information" style="width: 186px;"><br>
					<br>

					<textarea name="paragraph_text" cols="50" rows="10"
						style="width: 1136px; height: 107px; text-indent: 50px;"></textarea>
					<br> <br> <br> <label for="successesInput">Successes</label><br>

					<textarea name="successes" cols="50" rows="10"
						style="width: 1136px; height: 107px; text-indent: 50px;"></textarea>
					<br> <br> <br> <label for="trainingInput">Challenges</label><br>
					<textarea name="challenges" cols="50" rows="10"
						style="width: 1136px; height: 107px; text-indent: 50px;"></textarea>
					<br> <br>
				</div>
				<div class="form-group" >
					<input class="btn btn-primary " type="submit" value="submit">
					<a href="volunteer.jsp"><button type="button"
							class="btn btn-primary">Cancel</button></a>
				</div>
			</div>
		</form>
	</div>
	<BR>
	<BR>
	<script src="util.js"></script>
	<script type="text/javascript">
	$('.radio-button').on("click", function(event){
	    $('.radio-button').prop('checked', false);
	     $(this).prop('checked', true);
	});
	$('.radio-button1').on("click", function(event){
	    $('.radio-button1').prop('checked', false);
	     $(this).prop('checked', true);
	});
	$('.radio-button2').on("click", function(event){
	    $('.radio-button2').prop('checked', false);
	     $(this).prop('checked', true);
	});
    </script>
	<div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>