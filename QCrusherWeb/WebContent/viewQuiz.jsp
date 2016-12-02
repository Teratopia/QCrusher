<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />


<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Quiz</title>
</head>
<body>
<div class="container-fluid">
	<%@include file="/WEB-INF/common/head.inc"%>
	<div class="jumbotron">
		<h1>${quiz.name}</h1>
		<em>Created by ${quiz.user.username} on ${quiz.createDate} </em>
	</div>
	<hr>
	<ul>
		<li>Created on ${quiz.createDate	}</li>
		<li>Contains ${fn:length(quiz.questionObjects)} questions</li>
		<li>Attempted ${fn:length(quiz.attempts)} times</li>
		<li>Average Score: <fmt:formatNumber type="number"
				maxFractionDigits="1" value="${quiz.averageScore}" />%</li>
		<li>High Score: <fmt:formatNumber type="number"
				maxFractionDigits="1" value="${quiz.highScore}" />% by
			${quiz.highScoringAttempt.user.username} on
			${quiz.highScoringAttempt.dateTime }
		</li>
	</ul>

	<form action="takeQuiz">
	
		<sec:authorize access="isAnonymous()">
			<input type="hidden" name="username" value="Anonymous" />
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="username" value="${principal.username}" />
		</sec:authorize>
		
		<input type="hidden" name="quizNumber" value="${quiz.id}" /> 
		<input type="submit" value="Take Quiz" />
	</form>

	<c:if test="${not empty allowedToViewQuestions}">
		<h3>You ${createdOrAttempted} this quiz.</h3>
		<h5>Questions:</h5>
		<ol>
			<c:forEach var="question" items="${quiz.questionObjects}">
				<li>Q: ${question.question} A: ${question.answer}
				<form action = "removeQuestion">
				<input type="hidden" name="questionId" value="${question.id}" />
				<input type="hidden" name="quizID" value="${quiz.id}" />
				<input type="hidden" name="username" value="${quiz.user.username}" />
				<input type="submit" value="Remove Question"/>
				</form>
				</li>
			</c:forEach>
		</ol><br>
		<h5>Ratings:</h5>
		<ol>
			<c:forEach var="rating" items="${quiz.quizRatings}">
				<li>${rating.rating}/10: "${rating.feedback}"</li>
			</c:forEach>
		</ol>
		<h6>Average Rating: ${averageRating}/10</h6>
	</c:if>
	<form action = "account">
		<input type="hidden" name="username" value="${quiz.user.username}" />
		<input type = "submit" value = "Back to Profile"/>
	</form>
</div>
</body>
</html>