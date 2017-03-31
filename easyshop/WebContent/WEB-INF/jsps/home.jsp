<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home</title>
</head>
<body>

	<div class="header">
		<a class="logout" href="${pageContext.request.contextPath}/login">Log
			Out</a>
	</div>
	<div class="admin">
		<sec:authorize access="hasAuthority('admin')">
			<a href="${pageContext.request.contextPath}/admin">Admin Page</a>
		</sec:authorize>
	</div>

		<table class="items">
			<tr>
				<th>Item Id</th>
				<th>Item Name</th>
				<th>Item Price</th>
				<th>Item Quantity</th>
				<th></th>
			</tr>

			<c:forEach var="item" items="${items}">
				<tr>
					<td><c:out value="${item.item_id}"></c:out></td>
					<td><c:out value="${item.item_name}"></c:out></td>
					<td><c:out value="${item.item_price}"></c:out></td>

					<td>
						<form action="${pageContext.request.contextPath}/quantityprocess">
							<input type="hidden"  name="item.item_id"
								value="${item.item_id}" /> <input type="hidden"
								name="item.item_name" value="${item.item_name}" /> <input
								type="hidden" size="10" name="item.item_price" value="${item.item_price}" />
							<input type="text" size="10" name="item.item_quantity" />
							<td><input type="submit" value="AddToCart"></td>
						</form>
					</td>

				</tr>
			</c:forEach>
		</table>

</body>
</html>