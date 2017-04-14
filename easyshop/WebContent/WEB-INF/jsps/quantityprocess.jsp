<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.anrup.web.ldo.Item" import="java.util.ArrayList"
	import="java.util.List"%>
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

	<jsp:useBean id="itemldo" class="com.anrup.web.ldo.Item"></jsp:useBean>
	<%
		List<Item> items = new ArrayList<Item>();

		itemldo.setItem_id(Integer.parseInt(request.getParameter("item_id")));
		itemldo.setItem_name(request.getParameter("item_name"));
		itemldo.setItem_price(Integer.parseInt(request.getParameter("item_quantity")));
		itemldo.setItem_quantity(request.getParameter("item_price"));
		double total = itemldo.getItem_price() * Integer.parseInt(itemldo.getItem_quantity());
		itemldo.setTotal(total);
		items.add(itemldo);

		session.setAttribute("items", items);
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
				<c:forEach var="item" items="${items}">
					<td><c:out value="${item.getItem_id()}"></c:out></td>
					<td><c:out value="${item.getItem_name()}"></c:out></td>
					<td><c:out value="${item.getItem_price()}"></c:out></td>
					<td><c:out value="${item.getItem_quantity()}"></c:out></td>
					<td><c:out value="${item.getTotal()}"></c:out></td>

				</c:forEach>
			</tr>
		</table>

		<p>
			<a href="${pageContext.request.contextPath}/">Continue Shopping</a>
		</p>
	</div>

</body>
</html>