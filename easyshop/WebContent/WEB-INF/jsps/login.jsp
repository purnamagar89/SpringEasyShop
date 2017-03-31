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


	<div class="errorMsg">
		<c:if test="${param.error != null}">
			<p class="error">login failed. username/password is incorrect</p>
		</c:if>

	</div>
	<div class="login">




		<form name='f' action='${pageContext.request.contextPath}/login'
			method='POST'>
			<table>
				<tr>
					<td></td>
					<td><h2>Sign In</h2></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type='text' name='username' value=''
						style="height: 25px; width: 170px;"></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input style="height: 25px; width: 170px;" type='password'
						name='password' /></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td></td>
					<td colspan='3'><input type="image" alt="Sign in" width="178"
						height="30" style="text-align: center;font-size:13px;"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>

				<input name="${_csrf.parameterName}" type="hidden"
					value="${_csrf.token}" />
				<tr>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td style ="font-size:13px">New User?</td>
				</tr>

				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/createaccount">
							<img alt="Create Account"
							style="width: 178px; height: 30px; color: black;font-size:14px">
					</a></td>
				</tr>

			</table>

		</form>
	</div>
</body>
</html>