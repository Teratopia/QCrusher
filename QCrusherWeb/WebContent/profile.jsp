<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authentication var="principal" property="principal" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body> 	
<div class="container-fluid">
	<%@include file="/WEB-INF/common/head.inc"%>
	<%-- We are using the "principal" object (referenced by a JSTL variable of the same name).
	This object is set upon login.--%>
	<%-- <h3>Username in Spring Security Principal: <c:out value="${principal.username}"/></h3> --%>
	
	<div class="jumbotron">
	<h1>Your Profile</h1>
	<em>You are logged in as <strong>${username}</strong></em>
	</div>
	<h3>Your Quiz Taking Statistics:</h3>
	<h6>Total correct question attempts: ${correctAttempts.size()}</h6>
	<h6>Total incorrect question attempts: ${incorrectAttempts.size()}</h6>
	<h6>Total average: %${totalAverage}</h6>
	<h3>Your Quiz Building Statistics:</h3>
	<h6>Number of Quizzes Created: ${numQuizzesCreated}</h6>
	<h6>Total number of incorrect guesses to your questions: ${numStumpQuestions}</h6>
	<h6>Total number of correct guesses to your questions: ${numNonStumpQuestions}</h6>
	<h6>Stump-Rate: %${stumpRate}</h6>
	
	<form action="viewQuiz" method="GET"> 
		<select name="quizID">
			<c:forEach var="quiz" items="${quizzes}">
	
				<option value="${quiz.id}">${quiz.name}</option>
				
			</c:forEach>
		</select> 
		<input type = "hidden" name = "username" value = "${username}"/>
		<input type = "submit" class = "btn btn-info" value = "View Quiz"/>
	</form>
	<form action = "createQuiz" method = "GET">
		<input type = "hidden" name = "username" value = "${username}"/>
		<input type = "submit" class = "btn btn-success" value = "Create New Quiz"/>
	</form>
	<br>
	<br>
	<form action = "deleteUser" method = "GET">
		<input type = "hidden" name = "username" value = "${username}"/>
		<input type = "submit" class = "btn btn-danger" value = "Delete My Account"/>
	</form>
	
</div>
</body>
</html>