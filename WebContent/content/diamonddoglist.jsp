<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <title>Diamond Dog List</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
      font-style:strong;
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
  h4{
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
  th{
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
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    

    </div>
   

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="/dogwisedata/">Home</a></li>
        <li><a href="emeralddoglist.jsp">Emerald Dog List</a></li>
        <li><a style="background-color:#fff" href="#">Diamond Dog List</a></li>
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
<h4>Diamond Dog List</h4>        
  <table class="table table-bordered">
    <thead>
      <tr>
        <th id="index">#</th>
        <th id="identification">ID#</th>
        <th id="dogName">Name</th>
        <th id="suiteNumber">Suite#</th>
        <th id="dogSelect">Select</th>
      </tr>
      <tr>
       <th>1</th>
        <th>046579</th>
        <th >Kula</th>
        <th >102</th>
        <th><button type="button" name="stream" ><a href="dogwiseform.jsp">Select</a></button></th>
      </tr>
    </thead>
    </table>
    </div>
    </div>
    <br>
    <br>
    <div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>