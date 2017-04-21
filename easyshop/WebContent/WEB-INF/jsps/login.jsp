<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/welcome.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body onload='document.f.username.focus();'>

	<div class="header">

		 <div class="header_contents">
			<ul>
				<li id="toolbar-contents"><a href="#home">Home</a></li>
				<li id="toolbar-contents"><a href="#news">News</a></li>
				<li id="toolbar-contents"> <a href="#contact">Contact</a></li>
				<li id="toolbar-contents"><a href="#about">About</a></li>
			</ul>
		</div>


	</div>

	<div class="errorMsg">
		<c:if test="${param.error != null}">
			<p class="error">login failed. username/password is incorrect</p>
		</c:if>

	</div>
	<p></p>
	<div class="login">

		<form name='f' action='${pageContext.request.contextPath}/login'
			method='POST'>
			<table>
				<tr>
					<td><h2>Sign In</h2></td>
				</tr>
				<tr>
					<td style="text-align: left">Email</td>
				</tr>
				<tr>
					<td><input type='text' name='username' value=''
						style="height: 25px; width: 220px;"></td>
				</tr>

				<tr>
					<td style="text-align: left">Password</td>
				</tr>
				<tr>
					<td><input style="height: 25px; width: 220px;" type='password'
						name='password' /></td>
				</tr>
				<tr>
					<td><input name="${_csrf.parameterName}" type="hidden"
						value="${_csrf.token}" /></td>
				<tr>
				<tr>
					<td><input class="account_login_button" type="submit" value="Sign In"></td>
				</tr>
				<tr>

					<td><p></p></td>
				</tr>
				<tr>
					<td style="font-size: 18px">New User?</td>
				</tr>

				<tr>
					<td><input class="account_create_button" type="button" value="Create Account"
						onclick="window.location.href='${pageContext.request.contextPath}/createaccount'" /></td>
				</tr>

			</table>

		</form>
	</div>
</body>
</html>