<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>
	<%-- Every page includes this file. This is an easy way of having common navigation. --%>
	<%@include file="/WEB-INF/common/head.inc"%>
	<div id="login-box">

		<h2>Login with Username and Password</h2>
		<p>The request is sent to j_spring_security_check which is Spring Security's endpoint. See this JSP's source code for comments describing the behavior.</p>

		<%-- Spring gives us an Exception in the model, and we can display its error message.
		Another option is to set an error message in the Model via the Controller. This is "error" below. --%>
		
		<c:if test="${not empty error}">
			<div class="error">Spring error message: ${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
			<div class="error">Controller error message: ${error}</div>
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

</body>
</html>