<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
 <title>Admin Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<style>
.jumbotron {
      
      color: #000000;
      padding: 100px 25px;
      font-family: "Times New Roman", Times,mj\
       serif;
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
  .form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
h2{
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
      </ul>
    </div>
    </div>

</nav>
</div>
<BR><BR><BR><BR>

  <div class="container ">

      <form class="form-signin" method="post" action="../AdminLoginServlet">
        <h2 class="form-signin-heading ">Admin Login</h2>
        <label for="inputUsername" class="sr-only">Username</label>
        <input type="text" name="username" class="form-control" placeholder="username" value="" required="" autofocus="">
         <!-- <input type="text" id="userName" class="form-control" placeholder="username" autofocus=""> -->
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="userpass" class="form-control" placeholder="Password" value="" required="">
        <!-- <input type="password" id="password" class="form-control" placeholder="Password" > -->
        
        <input class="btn btn-large btn-info center-block" type="submit" name="Submit" value="Login"></td>
       <!--  <a class="btn btn-large btn-info center-block" href="admintask.jsp">Login</a> -->
      </form>
    </div> 
    
    <div>
    <jsp:include page="footer.jsp"/>
</div>
   </body>
   </html>
 
