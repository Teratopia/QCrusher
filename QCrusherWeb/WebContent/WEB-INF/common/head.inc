<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- We use Spring Security tags to decide which nav to show the user.
	Don't style your divs with the inline "style" tag. Use a CSS file.
--%>
<div id="header">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<c:url value="/welcome"/>">QCrusher</a>
    </div>
    <ul class="nav navbar-nav">
	<sec:authorize access="isAnonymous()">
		<li><a href="<c:url value="/login"/>">Log In</a></li>
		<li><a href="<c:url value="/signup"/>">Sign Up</a></li>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<li><a href="<c:url value="/logout"/>">Log Out</a></li>
	<li><a href="<c:url value="/account?username=${principal.username}"/>">Account</a></li>
	</sec:authorize>
	</ul>
  </div>
</nav>
</div>
