<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Interactions Form</title>
<link href="/dogwisedata/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="/dogwisedata/datepicker/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<link href="/dogwisedata/assets/css/bootstrap-united.css" rel="stylesheet" />
<link href="/dogwisedata/assets/css/bootstrap-united.css" rel="stylesheet" />
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

</style>
</head>
<body>
	<script src="/dogwisedata/datepicker/js/bootstrap-datetimepicker.js">
		
	</script>
<div>
    <jsp:include page="header.jsp"/>
</div>
		<div>
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header navbar-center">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>


    </div>
   

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/dogwisedata/">Home</a></li>
        <li><a href="dogstype.jsp">View Dog</a></li>
        <li><a style="background-color:#fff" href="#">Volunteer Log</a></li>
      
      </ul>
    </div>
    </div>

</nav>
</div>
			<div class="container">
				
						<form id="myForm" method="post" class="bs-example form-horizontal"
							action="../DogWiseDataController">
							<div class="form-group" >
							<label for="dateAndTime">Date and Time</label>
							<div class='input-group date' id='datetimepicker' style="width: 304px; ">
								<input type='text' class="form-control" name="datetimepicker"/> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
							<br>
							
							
							<label for="walkInput">Walk</label><br>
									<input type="checkbox" name="potty" id="pottyInput">&nbsp;&nbsp;Potty&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="exercise" id="exerciseInput">&nbsp;&nbsp;Exercise&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="checkbox" name="training" id="trainingInput">&nbsp;&nbsp;Training&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;Length of Time:&nbsp;&nbsp;<input type="text" onchange="if (!validate(this.value)) { alert('incorrect value'); this.value = ''; }" name="timeLength" id="timelengthInput" placeholder="time" style="width: 81px; ">
									<br><br>
							
							<label for="playTimeInput" >Play Time</label><br>
									
									<input type="checkbox" name="parkPlay" id="parkPlayInput">&nbsp;&nbsp;Park Play&nbsp;&nbsp;&nbsp;&nbsp;  
									<input type="checkbox" name="fetch" id="fetchInput">&nbsp;&nbsp;Fetch&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="tug" id="tugInput">&nbsp;&nbsp;Tug&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="checkbox" name="playGroups" id="playGroupsInput">&nbsp;&nbsp;Play Groups&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;Length of Time:&nbsp;&nbsp;<input type="text" onchange="if (!validate(this.value)) { alert('incorrect value'); this.value = ''; }" name="timeLength1" id="timelength1Input" placeholder="time" style="width: 81px; "><br><br>
							
							<label for="quietTimeInput" >Quiet Time</label><br>
									
									<input type="checkbox" name="inroom" id="inroomInput">&nbsp;&nbsp;In Room&nbsp;&nbsp;&nbsp;&nbsp;  
									<input type="checkbox" name="outsideroom" id="outsideroomInput">&nbsp;&nbsp;Outside Room&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;Length of Time:&nbsp;&nbsp;<input type="text" onchange="if (!validate(this.value)) { alert('incorrect value'); this.value = ''; }" name="timeLength2" id="timelength2Input" placeholder="time" style="width: 81px; "><br><br>
									
							<label for="trainingInput" >Training</label><br>
									
									<input type="checkbox" name="sit" id="sitInput">&nbsp;&nbsp;sit&nbsp;&nbsp;&nbsp;&nbsp;  
									<input type="checkbox" name="down" id="downInput">&nbsp;&nbsp;Down&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="stand" id="standInput">&nbsp;&nbsp;Stand&nbsp;&nbsp;&nbsp;&nbsp;  
									<input type="checkbox" name="watch" id="watchInput">&nbsp;&nbsp;Watch&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="peoplefoodgood" id="poplefoodgoodInput">&nbsp;&nbsp;People=Food=Good&nbsp;&nbsp;&nbsp;&nbsp;  
									<input type="checkbox" name="politegreeting" id="politeGreetingInput">&nbsp;&nbsp;Polite Greeting&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="staySettle" id="staySettleInput">&nbsp;&nbsp;Stay/Settle&nbsp;&nbsp;&nbsp;&nbsp; <br>
									<br> 
									<input type="checkbox" name="leavetakethanks" id="leavetakethankInput">&nbsp;&nbsp;Leave it/take it/Thank you&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="kongtraining" id="kongtrainingInput">&nbsp;&nbsp;Kong Training&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="cratetraining" id="cratetrainingInput">&nbsp;&nbsp;Crate Training&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="other" id="otherInput">&nbsp;&nbsp;Other&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="otherInfo" id="otherInfoInput" placeholder="other information" style="width: 120px; "><br><br>
									
									<textarea name="paragraph_text" cols="50" rows="10"></textarea><br><br><br><br><br><br>
									<label for="successesInput" >Successes</label><br>
									
									<textarea name="successes" cols="50" rows="10"></textarea>
									<br><br><br><label for="trainingInput" >Challenges</label><br><textarea name="challenges" cols="50" rows="10"></textarea><br><br>
							</div>
							
							
							

								

								


								<div class="col-lg-9 col-lg-offset-3">
									<button class="btn btn-default">Cancel</button>

									<button class="btn btn-primary" data-toggle="modal"
										data-target="#themodal">Submit</button>

								</div>

							
						</form>
					</div>
			

	<script>
		$(function() {
			$('#datetimepicker').datetimepicker();
		});
	</script>
	<script>
	function validate​(value){
    return value.match(new RegExp("^(([0-9])*$")) != null;}
    </script>
}​
<div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>