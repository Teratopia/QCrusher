<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
<title>Quiz Selection</title>

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
	What is the capital of Alberta?

Answer: <input type="text" name="userAnswer">
	<form method="link" action="scoreQuiz.do">
		<input type="submit" value="Score Quiz">
	</form>
		<form method="link" action="scoreQuiz.do">
		<input type="submit" value="I don't know">
	</form>
<hr>
</div>
<div class="row">
	Correct answer: ${correctAnswer }
	Percent Match${regexCalculation }
	<input class="quizButton" type="button" value="nextQuestion">
	
	 <form action="demo_form.asp">
	 Feedback: <input type="text" name="feedback"><br>
	  <input type="submit" value="Submit">
	</form>
		Rating Box <div class="rating">
		<span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span></div>
</div>
</div>
</body>
</html>