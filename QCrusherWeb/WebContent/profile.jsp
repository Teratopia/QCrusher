<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authentication var="principal" property="principal" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>
	<%@include file="/WEB-INF/common/head.inc"%>
	<%-- We are using the "principal" object (referenced by a JSTL variable of the same name).
	This object is set upon login.--%>
	<h3>Username in Spring Security Principal: <c:out value="${principal.username}"/></h3>
</body>
</html>