<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header navbar-center">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <h3 ><strong>Dog Wise Data</strong></h3>

    </div>
   

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="/dogwisedata/">Home</a></li>
        <li><a style="background-color:#fff" href="#">Emerald Dog List</a></li>
        <li><a href="diamonddoglist.jsp">Diamond Dog List</a></li>
      </ul>
    </div>
    </div>

</nav>
<br>
<br>
<br>
<br>
<div class="container">
<div class="table-responsive">  
<h4>Emerald Dog List</h4>        
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>#</th>
        <th>ID#</th>
        <th>Name</th>
        <th>Suite#</th>
      </tr>
    </thead>
    </table>
    </div>
    </div>
</body>
</html>