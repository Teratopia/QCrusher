<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Quiz</title>
</head>
<body>
	<%@include file="/WEB-INF/common/head.inc"%>
	
<c:choose>
	<c:when test = "${empty quiz}">
		<h1>Create a Quiz</h1>
		<form action = "createNewQuiz">
			<input type = "hidden" name = "username" value = "${username}">
			<h4>Quiz Name: <input type = "text" name = "quizName"/></h4>
			<input type = "submit" value = "Create Quiz"/>
		</form>
	</c:when>
	<c:otherwise>
		<h4>Quiz Name: ${quiz.name}</h4>
			<ol>
			<c:forEach var = "item" items = "${quiz.questionObjects}">
				<li>Question ${loop.index}: ${item.question}<br>
					Answer: ${item.answer}</li>
			</c:forEach>
			</ol>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test = "${not empty quiz.id}">
		<form action = "createNewQuestion">
		<input type = "hidden" name = "quizId" value = "${quiz.id}">
		<input type = "hidden" name = "username" value = "${username}">
		<h6>Question: <input type = "text" name = "question"/></h6>
		<h6>Answer: <input type = "text" name = "answer"/></h6>
		<input type = "submit" value = "Add Question"/>
		</form>
		<form action = "viewQuiz">
		<input type = "hidden" name = "quizID" value = "${quiz.id}">
		<input type = "hidden" name = "username" value = "${username}">
		<input type = "submit" value = "Finish Quiz"/>
		</form>
	</c:when>
</c:choose>
</body>
</html>