<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- A variable to get the "principal" (logged in user) onto the page with JSTL -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<%@include file="/WEB-INF/common/head.inc"%>
	Welcome to the site! Note the difference in the navigation if you are logged in.
	<sec:authorize access="isAnonymous()">
	<p>Try to go to <a href="<c:url value="/account"/>">/account</a> to see how the page is protected by login.</p>
	</sec:authorize>
</body>
</html>