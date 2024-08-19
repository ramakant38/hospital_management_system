<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="bootstrap_css.jsp"%>
</head>
<body>
	<nav
		class="navbar navbar sticky-top navbar-success  shadow-sm p-3 mb-5 bg-warning rounded">
		<div class="container-fluid ">
			<a class="navbar-brand" href="index.jsp">Health Care</a>
			<div class="d-flex">
			    <a class="nav-link" style="padding-right: 20px" href="admin_login.jsp">Admin</a>

			    <a class="nav-link" style="padding-right: 20px" href="doctor_login.jsp">Doctor</a>

			    <a class="nav-link" style="padding-right: 20px" href="user_login.jsp">User</a>

			</div>
		</div>
	</nav>
</body>
</html>