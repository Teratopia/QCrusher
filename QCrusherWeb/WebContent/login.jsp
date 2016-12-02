<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body onload='document.loginForm.username.focus();'>
	<div class="container-fluid">
	<%-- Every page includes this file. This is an easy way of having common navigation. --%>
	<%@include file="/WEB-INF/common/head.inc"%>
	<div class="jumbotron">

		<h2>Login with Username and Password</h2>

		<%-- Spring gives us an Exception in the model, and we can display its error message.
		Another option is to set an error message in the Model via the Controller. This is "error" below. --%>
		
		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="alert alert-success">${msg}</div>
		</c:if>

		<%-- We use c:url to create url's that are relative to the webapp. Note 
		the form's action; this is Spring's endpoint for security. No Controller is
		mapped to handle this post. See /WEB-INF/spring/security-config.xml for setup. --%>
		<form name='loginForm'
			action="<c:url value='j_spring_security_check' />" method='POST'>

			<table>
				<tr>
					<%-- The parameter names "username" and "password" are set in security-config.xml. --%>
					<td>User:</td>
					<td><input type='text' name='username' value=''></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>
					<td colspan='2'><input name="submit" type="submit"
						value="submit" /></td>
				</tr>
			</table>

			<%-- This is a security measure to prevent CSRF. Turned off in this app.
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			--%>
		</form>
	</div>
	</div>
</body>
</html>