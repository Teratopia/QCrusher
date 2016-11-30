<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quiz Score</title>
</head>
<body>
<%@include file="/WEB-INF/common/head.inc"%>

<h2>Your score for ${quiz.name}:</h3>

<ul>
<c:forEach var = "attemptq" items = "${answeredQuestions}">
<li>${attemptq.questionObject.question} <br>
	Desired Answer: ${attemptq.questionObject.answer}.<br>
	Answered Correctly: ${attemptq.passFail}.</li>
</c:forEach>
</ul>

<h3>Percent Correct: ${percentCorrect}</h3>

</body>
</html>