<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Take Quiz</title>
</head>
<body>
	<h1>${quiz.name}</h1>

	<h3>Question Number ${questionNumber}: ${question.question}</h3>


	<form action="takeQuiz">
		<input type="hidden" name="quizNumber" value="${quizNumber}" /> 
		<input type="hidden" name="questionNumber" value="${questionNumber}" />
		<input type = "hidden" name = "username" value = "${principal.username}"/>
		<c:choose>
			<c:when test="${empty percentMatch}">
			
				<input type="text" name="answerText" />
				<input type="submit" name="Submit" />
				
			</c:when>
			<c:when test="${not empty percentMatch}">

				<h3>Your Answer Was ${passFail}</h3>
				<h3>You Answered: ${userAnswer}</h3>
				<h3>Correct Answer: ${rightAnswer}</h3>
				<h3>Percent Match: ${percentMatch}</h3>
				<hr>
				<h3>How would you rate this question?<select name="questionRating">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></h3>
				<h3>Any feedback for the question writer?</h3>
				<input type="text" name="feedbackText" />

				<input type="submit" value="Continue" />
			</c:when>
		</c:choose>
	</form>

</body>
</html>