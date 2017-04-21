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


		<div class="header_contents">
			<ul>
				<li id="toolbar-contents"><a href="#home">Home</a></li>
				<li id="toolbar-contents"><a href="#news">News</a></li>
				<li id="toolbar-contents"><a href="#contact">Contact</a></li>
				<li id="toolbar-contents"><a href="#about">About</a></li>
			</ul>
		</div>
	</div>

	<div class="home">
		<a href="${pageContext.request.contextPath}/">Home</a>
	</div>

	<h2>Upload Item</h2>

	<form action="${pageContext.request.contextPath}/uploadImage"
		method="post" enctype="multipart/form-data">
		<table>

			<tr>
				<td>Item Category:</td>
				<td><input type="text" name="item_category" /></td>

			</tr>


			<tr>
				<td>Item Name:</td>
				<td><input type="text" name="item_name" /></td>

			</tr>

			<tr>
				<td>Item Price:</td>
				<td><input type="text" name="item_price" /></td>
			</tr>

			<tr>
				<td>select item:</td>
				<td><input type="file" name="item_image" required="required" />
					<br /></td>
				<td><input name="${_csrf.parameterName}" type="hidden"
					value="${_csrf.token}" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="AddItem"></td>
			</tr>

		</table>

	</form>

	<%-- <div>
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
					<td><input type="text" name="item_location"
						required="required" /></td>

				</tr>

				<tr>
					<td><input type="submit" value="AddItem"></td>

				</tr>
			</table>
		</sf:form>
	</div>
 --%>
</body>
</html>