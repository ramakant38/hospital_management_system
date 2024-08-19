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
<% int docid = (int)session.getAttribute("doctorId"); %>
	<ul
		class="nav nav-tabs justify-content-end  shadow-sm p-3 mb-5 bg-warning rounded">
		<li class="nav-item me-auto"><a class="nav-link text-dark" href="index.jsp">Hospital</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="profile?id=<%=docid%>">Profile</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="doctorlogout?id=<%=docid%>">Logout</a></li>
	</ul>
</body>
</html>