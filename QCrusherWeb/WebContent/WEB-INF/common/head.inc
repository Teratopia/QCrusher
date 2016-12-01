<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- We use Spring Security tags to decide which nav to show the user.
	Don't style your divs with the inline "style" tag. Use a CSS file.
--%>
<div id="header">
	<sec:authorize access="isAnonymous()">
		<div style="float:right; margin-right: 10px;"><a href="<c:url value="/login"/>">Log In</a></div>
		<div style="float:right; margin-right: 10px;"><a href="<c:url value="/signup"/>">Sign Up</a></div>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div style="float:right; margin-right: 10px;"><a href="<c:url value="/logout"/>">Log Out</a></div>
		<div style="float:right; margin-right: 10px;"><a href="<c:url value="/account?username=${principal.username}"/>">Account</a></div>
	</sec:authorize>
	<div style="float:right; margin-right: 10px;"><a href="<c:url value="/"/>">Home</a></div>

</div>
<div style="clear:both;"></div>
