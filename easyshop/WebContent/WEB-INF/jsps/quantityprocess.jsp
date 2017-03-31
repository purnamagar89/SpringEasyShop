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
		<a class="logout" href="${pageContext.request.contextPath}/login">Log
			Out</a>
	</div>

	<div class="home">
		<a href="${pageContext.request.contextPath}/">Home</a>
	</div>


	<%
		String id = request.getParameter("item.item_id");
		String name = request.getParameter("item.item_name");
		String q = request.getParameter("item.item_quantity");
		String p = request.getParameter("item.item_price");

		int quantity = Integer.parseInt(q);
		int price = Integer.parseInt(p);
		double total = quantity * price;
	%>

	<div class="orderprocess">
		<table>
			<tr>
				<th>Item Id</th>
				<th>Item name</th>
				<th>Item price</th>
				<th>Item quantity</th>
				<th>Item total</th>
			</tr>
			<tr>

				<td><%=(id)%></td>
				<td><%=(name)%></td>
				<td><%=(price)%></td>
				<td><%=(quantity)%></td>
				<td><%=(total)%></td>
			</tr>
		</table>
		<p>
			<a href="${pageContext.request.contextPath}/">Continue Shopping</a>
		</p>
	</div>

</body>
</html>