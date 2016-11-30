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


<form action = "takeQuiz">
	<input type ="text" name = "answerText"/>
	<input type = "hidden" name = "quizNumber" value = "${quizNumber}"/>
	<input type = "hidden" name = "questionNumber" value = "${questionNumber}"/>
	<input type = "submit" name = "Submit"/>
	</form>

<%-- <c:forEach items = "${questions}" var = "question">
${question.question}<br>
${question.answer}<hr>
</c:forEach> --%>

</body>
</html>