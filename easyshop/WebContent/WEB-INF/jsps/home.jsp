<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.awt.print.Printable"
	import="org.springframework.security.taglibs.authz.JspAuthorizeTag"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@page import="java.sql.Blob" import="com.anrup.web.ldo.Item"
	import="java.util.*" import="java.io.OutputStream"
	import="java.sql.ResultSet" import="java.sql.PreparedStatement"
	import="java.sql.DriverManager" import="java.sql.Connection"
	import="java.sql.*" import="java.io.*"%>

<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/home.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/main.css">


<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/script/main_home.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home</title>
</head>
<body>

	<div class="header">

		<div class="header_content">
			<ul>
				<li><a href="#home">Home</a></li>
				<li><a href="#news">News</a></li>
				<li><a href="#contact">Contact</a></li>
				<li><a href="#about">About</a></li>
			</ul>
		</div>


		<div class="choice_dropdown">
			<select>
				<option value="all">All</option>
				<option value="electronics">Electronics</option>
				<option value="clothes">Clothes</option>
			</select>
		</div>


		<div class="dropdown">
			<input class="dropbtn" type="submit" value="&#9660;"
				onclick="myFunction()" />
			<!-- 	<button onclick="myFunction()" class="dropbtn">&#x25BC;</button> -->
			<p>
			<div id="myDropdown" class="dropdown-content">
				<a href="${pageContext.request.contextPath}/admin">Admin</a> <a
					href="#setting">Setting</a> <a
					href="${pageContext.request.contextPath}/login">Log out</a>
			</div>
		</div>

	</div>




	<jsp:useBean id="conProvider"
		class="com.fileupload.servlet.ConnectionProvider"></jsp:useBean>

	<jsp:useBean id="itemLdo" class="com.anrup.web.ldo.Item"></jsp:useBean>

	<%
		Connection con = null;
		List<Item> items = new ArrayList<Item>();
		try {

			String item_name;
			String item_price;
			int item_id;
			con = conProvider.getConnection();

			PreparedStatement ps = con
					.prepareStatement("select item_id,item_name,item_price from electronics_items");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				itemLdo.setItem_name(rs.getString("item_name"));
				itemLdo.setItem_price(Integer.parseInt(rs.getString("item_price")));
				itemLdo.setItem_id(rs.getInt("item_id"));
				items.add(itemLdo);
	%>

	<div class="items">

		<table>

			<tr
				style="background-color: rgb(128, 128, 128); color: white; height: 50px">
				<th class="row-Id">ID</th>
				<th class="row-name">NAME</th>
				<th class="row-image">IMAGE</th>
				<th class="row-price">PRICE</th>
				<th class="row-quantity" colspan="2">QUANTITY</th>
			</tr>

			<c:forEach var="item" items="${items}">
				<tr>

					<td style="background-color: rgb(128, 128, 128); color: white;"><c:out
							value="${item.getItem_id()}"></c:out></td>

					<td><c:out value="${item.getItem_name()}"></c:out></td>
					<td><img
						src="${pageContext.request.contextPath}/getImage?item_id=${item.getItem_id()}"
						width="130px" /></td>

					<td><c:out value="${item.getItem_price()}"></c:out></td>
					<td>
						<form action="${pageContext.request.contextPath}/quantityprocess">
							<input type="hidden" name="item_id" value="${item.getItem_id()}" />
							<input type="hidden" name="item_name"
								value="${item.getItem_name()}" /> <input type="hidden"
								size="10" name="item_price" value="${item.getItem_price()}" />
							<input type="text" size="15" name="item_quantity" />
							<td><input class="button_home" type="submit"
								value="AddToCart"></td>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	%>


	<%-- <table class="items">
		<tr
			style="background-color: rgb(128, 128, 128); color: white; height: 50px">
			<th>Item Id</th>
			<th>Item Name</th>
			<th>Item Price</th>
			<th colspan="2">Item Quantity</th>
		</tr>

		<c:forEach var="item" items="${items}">
			<tr>
				<td width="1%" style="background-color: rgb(128, 128, 128);"><c:out
						value="${item.item_id}"></c:out></td>
				<td><c:out value="${item.item_name}"></c:out></td>
				<td><c:out value="${item.item_price}"></c:out></td>

				<td>
					<form action="${pageContext.request.contextPath}/quantityprocess">
						<input type="hidden" name="item.item_id" value="${item.item_id}" />
						<input type="hidden" name="item.item_name"
							value="${item.item_name}" /> <input type="hidden" size="10"
							name="item.item_price" value="${item.item_price}" /> <input
							type="text" size="12" name="item.item_quantity" />
						<td><input class="button_home" type="submit"
							value="AddToCart"></td>
					</form>
				</td>

			</tr>
		</c:forEach>
	</table>
 --%>
</body>
</html>