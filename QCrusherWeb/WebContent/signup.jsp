<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Login Page</title>
</head>
<body onload='document.loginForm.username.focus();'>
<div class="container-fluid">
	<%-- Every page includes this file. This is an easy way of having common navigation. --%>
	<%@include file="/WEB-INF/common/head.inc"%>
	<div class="jumbotron">

		<h2>Create New Username and Password</h2>

		<%-- Spring gives us an Exception in the model, and we can display its error message.
		Another option is to set an error message in the Model via the Controller. This is "error" below. --%>

		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
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
</div>
</body>
</html>