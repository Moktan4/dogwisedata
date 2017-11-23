<%@page import="com.msis.dogwiseproject.backend.MyJDBCConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<title>Admin Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/dogwisedata/assets/img/favicon.ico" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
</head>
<style>
.jumbotron {
	color: #000000;
	padding: 100px 25px;
	font-family: "Times New Roman", Times, serif;
}

h4 {
	font-size: 24px;
	line-height: 1.375em;
	color: #000000;
	font-weight: 400;
	margin-bottom: 30px;
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
th{
  text-align:center;
  background-color: #008080;
	
	font-size: 14px !important;
	
	font-family: "Times New Roman", Times, serif;
	font-style: strong;
	color: #fff;
  }

 td{
  text-align:center;
  }
 
}
</style>
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
					<li><a style="background-color: #fff" href="#">Dog List</a></li>
				</ul>
			</div>
		</div>

		</nav>
	</div>
	<BR>
	<BR>
	<%
try {

Connection conn = null;

java.sql.PreparedStatement st=null;
ResultSet rs=null;

		
st =MyJDBCConnection.getConnection().prepareStatement("SELECT * from doglist");

rs = st.executeQuery();
%>

<div class="container">
<input style="width:30%;  float:right;"  type="text" id="search" placeholder="Type to search" autofocues="">
	<BR>
  <table class="table table-striped" id="table">
   <thead>
	<tr >
			<th>ID</th>
			<th>Name</th>
			<th>Suite/Room#</th>
			<th>Dog Information</th>
			<th>Selection</th>
		</tr>
		</thead>
		<%
while (rs.next()) {
%>
		<TR id="table">
			<TD><%=rs.getString(1)%></TD>
			<TD><%=rs.getString(2)%></TD>
			<TD><%=rs.getString(3)%></TD>
			<TD><%=rs.getString(5)%></TD>
			<TD> <a href="dogwiseform.jsp?id=<%=rs.getString(1) %>">SELECT</a> </TD>
		</TR>
		<% } %>
		<%
// close all the connections.
rs.close();
st.close();
} catch (Exception ex) {
%>
		
		<font size="+3" color="red"></b> <%
out.println("Unable to connect to database.");
		
}
	
%>
</font>
	</table>
	

	</div>
	
	<script type="text/javascript">
var $rows = $('#table tr');
$('#search').keyup(function() {
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
    
    $rows.show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
    }).hide();
});
</script>
	<div>

		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>