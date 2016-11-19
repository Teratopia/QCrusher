<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
<title>Homepage</title>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">QCrusher</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="main.do">Main Page</a></li>
      <li><a href="profile.do">Profile </a></li>
      <li><a href="createQuiz.do">Create Quiz</a></li> 
      <li><a href="about.html">About Us</a></li> 
    </ul>
  </div>
</nav>
  <div class="container-fluid">
	<div class="row">
<form method="link" action="takeQuiz.do">
		<input type="submit" value="Take a Quiz">
	</form>
<!-- 	Browse By Category -->
<form method="link" action="createQuiz.do">
		<input type="submit" value="CreateQuiz">
	</form>
<form method="link" action="profile.do">
		<input type="submit" value="View My Profile">
	</form>
<!-- Browse Users -->
</div>
</div>
</body>
</html>