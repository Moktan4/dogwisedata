<%@page import="com.msis.dogwiseproject.backend.MyJDBCConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Socialization Logs</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<style>

Table, TH, TR, TD {
    border-style : solid;
    border-color :green;
    border-width : medium;
        }

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
  background-color: orange;
	
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
    <jsp:include page="header.jsp"/>
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
					<li><a style="background-color: #fff" href="#">Socialization Logs</a></li>
					 <li><a href="volunteer.jsp">View Dog</a></li>
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

		
st =MyJDBCConnection.getConnection().prepareStatement("SELECT * from dogwisedata");



rs = st.executeQuery();
%>
<div class="container">
	<input style="width:30%;  float:right;"  type="text" id="search" placeholder="Type to search" autofocues="">
	<BR>
  <table width="100%" border="1" id="table">
   <thead>
	<tr >
			<th>Volunteer Date/Time</th>
			<th>Walk - minutes</th>
			<th>Play Time - minutes</th>
			<th>Quiet Time -minutes</th>
			<th>Training</th>
			<th>Successes</th>
			<th>Challenges</th>
		</tr>
		</thead>
		<%
while (rs.next()) {
%>
		<TR>
		
			<TD><%=rs.getString(1)%><br><%=rs.getString(2)%></TD>
			<TD><%
				if(!(rs.getString(3) == null || (rs.getString(3).equals(""))))%><%{%><%=rs.getString(3)%>
					<%
					}
				%><%
				if(!(rs.getString(4) == null || (rs.getString(4).equals(""))))%><%{%><%=rs.getString(4)%>
				<%
					}
				%><%
				if(!(rs.getString(5) == null || (rs.getString(5).equals(""))))%><%{%><%=rs.getString(5)%>
				<%
					}
				%>&nbsp; - &nbsp;<%=rs.getString(6)%></TD>
			<TD>
			<%
				if(!(rs.getString(7) == null || (rs.getString(7).equals(""))))%><%{%><%=rs.getString(7)%>
					<%
					}
				%>
				<%
				if(!(rs.getString(8) == null || (rs.getString(8).equals(""))))%><%{%><%=rs.getString(8)%>
					<%
					}
				%>
				<%
				if(!(rs.getString(9) == null || (rs.getString(9).equals(""))))%><%{%><%=rs.getString(9)%>
					<%
					}
				%>
				<%
				if(!(rs.getString(10) == null || (rs.getString(10).equals(""))))%><%{%><%=rs.getString(10)%>
					<%
					}
				%>
			
				&nbsp; - &nbsp;<%=rs.getString(11)%></TD>
			<TD>
			<%
				if(!(rs.getString(12) == null || (rs.getString(12).equals(""))))%><%{%><%=rs.getString(12)%>
					<%
					}
				%>
				<%
				if(!(rs.getString(13) == null || (rs.getString(13).equals(""))))%><%{%><%=rs.getString(13)%>
					<%
					}
				%>
			&nbsp; - &nbsp;<%=rs.getString(14)%></TD>
			<TD>
			<%
				if(!(rs.getString(15) == null || (rs.getString(15).equals(""))))%><%{%><%=rs.getString(15)%><br>
					<% 
					}
				%>
				<%
				if(!(rs.getString(16) == null || (rs.getString(16).equals(""))))%><%{%><%=rs.getString(16)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(17) == null || (rs.getString(17).equals(""))))%><%{%><%=rs.getString(17)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(18) == null || (rs.getString(18).equals(""))))%><%{%><%=rs.getString(18)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(19) == null || (rs.getString(19).equals(""))))%><%{%><%=rs.getString(19)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(20) == null || (rs.getString(20).equals(""))))%><%{%><%=rs.getString(20)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(21) == null || (rs.getString(21).equals(""))))%><%{%><%=rs.getString(21)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(22) == null || (rs.getString(22).equals(""))))%><%{%><%=rs.getString(22)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(23) == null || (rs.getString(23).equals(""))))%><%{%><%=rs.getString(23)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(24) == null || (rs.getString(24).equals(""))))%><%{%><%=rs.getString(24)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(25) == null || (rs.getString(25).equals(""))))%><%{%><%=rs.getString(25)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(26) == null || (rs.getString(26).equals(""))))%><%{%><%=rs.getString(26)%><br>
					<%
					}
				%>
				<%
				if(!(rs.getString(27) == null || (rs.getString(27).equals(""))))%><%{%><%=rs.getString(27)%>
					<%
					}
				%>
			</TD>
			<TD>&nbsp;&nbsp;<%=rs.getString(28)%>&nbsp;&nbsp;</TD>
			<TD>&nbsp;&nbsp;<%=rs.getString(29)%>&nbsp;&nbsp;</TD>
		</TR>
		<% } %>
		<%
// close all the connections.
rs.close();
st.close();
} catch (Exception ex) {
%>
		
		<font size="+3" color="red"></b></font> <%
out.println("Unable to connect to database.");
		
}
%>
	</table>
	<BR>

	</div>
<BR>
<BR>
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
    <jsp:include page="footer.jsp"/>
</div>

</body>
</html>