<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Take Quiz</title>
</head>
<body>
<div class="container-fluid">
<%@include file="/WEB-INF/common/head.inc"%>
	<div class="jumbotron">
		<h1>${quiz.name}</h1>
		<em>Created by ${quiz.user.username} on ${quiz.createDate} </em>
	</div>

	<strong>Question Number ${questionNumber} of ${quiz.length}:</strong><br> 
	<h3>${question.question}</h3>


	<form action="takeQuiz">
		<input type="hidden" name="quizNumber" value="${quizNumber}" /> 
		<input type="hidden" name="questionNumber" value="${questionNumber}" />
		<c:choose>
			<c:when test="${empty percentMatch}">
			
				<input type="text" name="answerText" />
				<input type="submit" class="btn btn-primary" name="Submit" />
				
			</c:when>
			<c:when test="${not empty percentMatch}">
				<c:choose>
					<c:when test="${passFail eq 'Correct!'}">
						<div class="alert alert-success">
					</c:when>
					<c:otherwise>
						<div class="alert alert-danger">
					</c:otherwise>
				</c:choose>
				<h3>Your Answer Was ${passFail}</h3>
				You Answered: ${userAnswer}<br>
				Correct Answer: ${rightAnswer}<br>
				Percent Match: ${percentMatch}<br>
				</div>
				<h5>How would you rate this question?</h5>
				<select name="questionRating">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
					</select></h3>
				<h5>Any feedback for the question writer?</h5>
				<input type="text" name="feedbackText" />

				<input type="submit" class="btn btn-primary" value="Continue" />
				
			</c:when>
		</c:choose>
	</form>
</div>
</body>
</html>