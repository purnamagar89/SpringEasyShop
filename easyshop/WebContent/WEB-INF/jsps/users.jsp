<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/users.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<a class="logout" href="${pageContext.request.contextPath}/">Log
			Out</a>
	</div>

	<div class="home">
		<a href="${pageContext.request.contextPath}/">Home</a>
	</div>

	<table class="user">
		<tr>
			<th>UserName</th>
			<th>Password</th>
			<th>Enabled</th>
			<th>Authority</th>
		</tr>

		<c:forEach var="user" items="${users}">
			<tr>
				<td><c:out value="${user.username}"></c:out></td>
				<td><c:out value="${user.password}"></c:out></td>
				<td><c:out value="${user.enabled}"></c:out></td>
				<td><c:out value="${user.authority}"></c:out></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>