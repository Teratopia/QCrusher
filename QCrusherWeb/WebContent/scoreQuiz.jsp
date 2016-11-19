<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quiz Scoring</title>
<link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
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
Score {score}

<form method="link" action="main.do">
		<input type="submit" value="Back to Main Page">
	</form>
	</div>
	</div>
</body>
</html>