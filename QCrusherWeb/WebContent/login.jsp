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
<title>QCrusher Login</title>
</head>
<body>
Username: <input type="text" name="username">
Password: <input type="text" name="password">
	<form method="link" action="main.do">
		<input type="submit" value="Log In">
	</form>
		<form method="link" action="createAccount.do">
		<input type="submit" value="Create Account">
	</form>

	<form method="link" action="takeQuiz.do">
		<input type="submit" value="Take Quiz">
	</form>
</body>
</html>