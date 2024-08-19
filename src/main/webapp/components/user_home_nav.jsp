<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="bootstrap_css.jsp" %>
</head>
<body>
<% 
  int userId = (int)session.getAttribute("userId"); 
%>
	<ul
		class="nav justify-content-end  shadow-sm p-3 mb-5 bg-warning rounded">
		<li class="nav-item me-auto"><a class="nav-link text-dark fs-5" href="index.jsp">Hospital</a></li>
		<li class="nav-item me-10"><a class="nav-link text-dark fs-6" href="user_homepage.jsp">User Home</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="temp_appointment">Book Appointment</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="temp_view">View
				Appointment</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="userLogout?id=<%=userId%>">Logout</a></li>
	</ul>
</body>
</html>