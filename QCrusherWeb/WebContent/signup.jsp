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

		<h2>Create New Username and Password</h2>

		<%-- Spring gives us an Exception in the model, and we can display its error message.
		Another option is to set an error message in the Model via the Controller. This is "error" below. --%>

		<c:if test="${not empty error}">
			<div class="error">Controller error message: ${error}</div>
		</c:if>

		<form name='signupForm' action="<c:url value='/createNewUser' />"
			method='GET'>
			<table>
				<tr>
					<td>Enter Username:</td>
					<td><input type='text' name='username'></td>
				</tr>
				<tr>
					<td>Enter Password:</td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>
					<td colspan='2'><input name="submit" type="submit"
						value="submit" /></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>