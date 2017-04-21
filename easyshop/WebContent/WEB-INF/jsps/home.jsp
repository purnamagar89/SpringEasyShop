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
	src="${pageContext.request.contextPath}/static/script/jquery.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/script/main_home.js">
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home</title>

<style type="text/css">
.search_img_button {
	background:
		url(${pageContext.request.contextPath}/static/images/find.png)
		no-repeat;
	height: 24.5px;
	width: 40px;
	cursor: pointer;
	border: none;
	border-radius: 2px;
	margin-left: -11.2%;
	background-size: 18px 18px;
	background-color: #0073e6;
	background-position: 10px 2px;
	background-repeat: no-repeat;
	padding: 6px 8px 6px 8px;
	cursor: pointer;
	border: 1px solid #0073e6;
}
</style>



</head>
<body>
	<div class="header">

		 <div class="header_contents">
			<ul>
				<li id="toolbar-contents"><a href="#home">Home</a></li>
				<li id="toolbar-contents"><a href="#news">News</a></li>
				<li id="toolbar-contents"> <a href="#contact">Contact</a></li>
				<li id="toolbar-contents"><a href="#about">About</a></li>
			</ul>
		</div>
 
		<div class="departments-dropdown">
			<ul class="outer">
				<li><a href="#"><span class="dept_color">Departments &#9662;</span></a>
					<ul id="inner" class="dropdown">
						<li><a href="${pageContext.request.contextPath}/">All</a></li>
						<li><a
							href="${pageContext.request.contextPath}/electronicsItems">Electronics</a></li>
						<li><a href="${pageContext.request.contextPath}/clothItems">Clothes</a></li>
					</ul>
				</li>
			</ul>
						
		</div>

		<div class="dropdown">
		<button class="dropbtn" onclick="myFunction()">&#9776;</button>
		<p>
			<div id="myDropdown" class="dropdown-content">
				<a href="${pageContext.request.contextPath}/admin">Admin</a> <a
					href="#setting">Setting</a> <a
					href="${pageContext.request.contextPath}/login">Log out</a>
			</div>
		</div>
		<div class="wrapper">
			<form class="item_search"
				action="${pageContext.request.contextPath}/searchResult">
				<input class="item_serch_input" type="text" name="search_items"
					placeholder="product search">
				<button name="button" class="search_img_button" id="item_search_btn"></button>

			</form>
		</div>
	</div>


	<div class="items">

		<table>
			<tr style="background-color: #8080ff; color: white; height: 30px">
				<th class="row-Id">Id</th>
				<th class="row-name">Name</th>
				<th class="row-image">Image</th>
				<th class="row-price">Price</th>
				<th class="row-quantity" colspan="2">Quantity</th>
			</tr>

			<c:forEach var="item" items="${items}">
				<tr>

					<td><c:out
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
							<input class="quantity-input-text" type="text" name="item_quantity" />
							<td><input class="add-to-cart-button" type="submit"
								value="AddToCart"></td>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
