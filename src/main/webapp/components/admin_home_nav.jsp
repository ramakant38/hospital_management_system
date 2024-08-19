<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="bootstrap_css.jsp"%>
</head>

<body>
<%int id = (int) session.getAttribute("adminId"); %>
	<ul class="nav justify-content-end  shadow-sm p-3 mb-5 bg-warning rounded">
	    <li class="nav-item me-auto"><a class="nav-link text-dark" href="temp_admin">Admin Home</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="temp_doctor">Add Doctor</a></li>
		
		<!-- go to DoctorController -->
		<li class="nav-item"><a class="nav-link text-dark" href="temp_specialist">Add Specialist</a></li>
		
		<li class="nav-item"><a class="nav-link text-dark" href="fetchAllDoctors">View Doctors</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="#">View Patients</a></li>
		<li class="nav-item"><a class="nav-link text-dark" href="adminlogout?id=<%=id%>">Logout</a></li>
	</ul>
</body>
</html>