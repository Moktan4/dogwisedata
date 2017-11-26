<html>
<head>
<head>
<title>DogWise</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="assets/img/favicon.ico" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
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

body{

  background: url("assets/img/dogwise.png") no-repeat ; 
  background-position: center center;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: auto;

}


}
</style>
<body>
	<div>
		<jsp:include page="content/header.jsp" />
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
						<li><a href="AdminServlet">I'm an Admin</a></li>
						<li><a href="VolunteerServlet">I am a Volunteer</a></li>
					</ul>
				</div>
			</div>

		</nav>
	</div>
	
	<div>
		<jsp:include page="content/footer.jsp" />
	</div>
</body>
</html>
