<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="header">
		<a class="logout" href="${pageContext.request.contextPath}/login">Log
			Out</a>
	</div>

	<div class="home">
		<a href="${pageContext.request.contextPath}/">Home</a>
	</div>


	<div>
		<sf:form action="${pageContext.request.contextPath}/itemadded"
			commandName="item">

			<table>
				<tr>
					<td>Item Name:</td>
					<td><sf:input type="text" path="item_name" name="item_name" /></td>

				</tr>

				<tr>
					<td>Item Price:</td>
					<td><sf:input type="text" path="item_price" name="item_price" /></td>

				</tr>
				<tr>
					<td><input type="submit" value="AddItem"></td>

				</tr>
			</table>
		</sf:form>
	</div>

</body>
</html>