<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
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

h4 {
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

th {
	text-align: center;
}

}
.container {
	max-height: calc(100% - 120px);
	overflow-y: scroll;
	padding: 0px 10% !important;
	margin-top: 60px !important;
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
					<li><a style="background-color: #fff" href="#">Add Dog</a></li>
					<li><a href="dogstype.jsp">View Dog</a></li>
				</ul>
			</div>
		</div>

		</nav>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="table-responsive">
			<h4>Add Dog</h4>
			<table class="table table-bordered">
				<BR>
				<form id="myForm" method="post" class="bs-example form-horizontal"
							action="../AdminDogInfoEntryController">
					<div class="form-group">
						<label for="animal_id" class="control-label">Animal ID</label> <input
							type="text" class="form-control" id="animal_id" name="dogID"
							placeholder="045678">
					</div>

					<div class="form-group">
						<label for="animal_name" class="control-label">Animal Name</label>
						<input type="text" class="form-control" id="animal_name"
							name="dogName" placeholder="Animal Name">
					</div>


					<div class="form-group">
						<label for="status_id" class="control-label">Status</label> <select
							class="form-control" id="status_id" name="dogStatus">
							<option value="New">New</option>
							<option value="Available for Adoption">Available for Adoption</option>
							<option value="On Hold">On Hold</option>
							<option value="Adopted">Adopted</option>
						</select>
					</div>

					<div class="form-group">
						<label for="suite_room" class="control-label">Room/Suite#</label>
						<input type="text" class="form-control" id="suiteroom_id"
							name="roomNumber" placeholder="###">
					</div>
					<div class="form-group">
						<input id="input-file" name="file" type="file" class="file"
							data-show-preview="false">
					</div>


					<div class="form-group">
						<button type="submit" class="btn btn-primary pull-right">Add
							Animal</button>
					</div>


				</form>
			</table>
		</div>
	</div>
	<br>
	<br>
	<div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>