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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/script/jquery.js"></script>
<title>Create New Account</title>

<script type="text/javascript">
	function onload() {
		$("#pass").keyup(checkPasswordMatch);
		$("#confirmpass").keyup(checkPasswordMatch);
		$("#form_id").submit(checkPasswordMatch);
	}

	function checkPasswordMatch() {
		var password = $("#pass").val();
		var confirmpassword = $("#confirmpass").val();

		if (password.length > 3 || confirmpassword.length > 3) {

			if (password == confirmpassword) {

				$("#passwordmatch")
						.text(
								"<fmt:message key='MatchedPassword.user.password'></fmt:message>");
				$("#passwordmatch").addClass("valid");
				$("#passwordmatch").removeClass("error");
				return true;

			} else {
				$("#passwordmatch")
						.text(
								"<fmt:message key='UnmatchedPassword.user.password'></fmt:message>");
				$("#passwordmatch").addClass("error");
				$("#passwordmatch").removeClass("valid");
				return false;
			}
		}
	}
	$(document).ready(onload);
</script>

</head>
<body>
	<div class="header">
		<a class="logout" href="${pageContext.request.contextPath}/login">Sign
			In</a>
	</div>

	<div class="createaccount">
		<h2>Create Account</h2>
		<sf:form id="form_id"
			action="${pageContext.request.contextPath}/accountcreated"
			commandName="user">
			<table>
				<tr>
					<td>User Name:
					<td>
					<td><sf:input style="height: 25px; width: 175px;" type="text"
							path="username" name="username" /><br>
						<div class="error">
							<sf:errors path="username" />
						</div>
					<td>
				</tr>
				<tr>
					<td>Password:
					<td>
					<td><sf:input style="height: 25px; width: 175px;" id="pass"
							type="text" path="password" name="password" /><br>
						<div class="error">
							<sf:errors path="password" />
						</div>
					<td>
				</tr>
				<tr>
					<td>Confirm Password:
					<td>
					<td><input style="height: 25px; width: 175px;"
						id="confirmpass" type="text" name="confirmpassword" /><br>
						<div id="passwordmatch"></div>
					<td>
				</tr>
				<tr>
					<td>
					<td>
					<td><input type="image" alt="Create New Account" width="181"
						height="30" style="text-align: center; font-size: 13px;">
					<td>
				</tr>
			</table>
		</sf:form>
	</div>
	

</body>
</html>