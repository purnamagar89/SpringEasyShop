<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<body>

	<div class="header">
		<a class="logout" href="${pageContext.request.contextPath}/login">Log
			Out</a>
	</div>

	<div class="home">
		<a href="${pageContext.request.contextPath}/">Home</a>
	</div>
	<p>
		<a href="${pageContext.request.contextPath}/users">show users</a>
	</p>

	<p>
		<a href="${pageContext.request.contextPath}/additem">Additem</a>
	</p>

</body>
</html>