<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
      font-style:strong;
      color: #fff;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #FEA900 !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #f4511e !important;
      background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #fff !important;
  }
}


</style>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header navbar-center">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     <img src="/assets/img/hssv_logo.jpeg"/>
      <h3 ><strong>Dog Wise Data</strong></h3>

    </div>
   

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="admin.jsp">I'm an Admin</a></li>
        <li><a style="background-color:#fff" href="#">I am a Volunteer</a></li>
      
      </ul>
    </div>
    </div>

</nav>
<div class="jumbotron text-center">
  <h4>Dogs Type</h4>
  <a href="emeralddoglist.jsp" class="btn btn-warning" role="button">Emerald Dogs</a>
  <a href="diamonddoglist.jsp" class="btn btn-warning" role="button">Diamond Dogs</a>

</div>
</body>
</html>