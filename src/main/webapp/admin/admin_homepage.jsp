<%@ page import="com.org.dao.AppointmentDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.org.dto.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../components/bootstrap_css.jsp"%>
</head>
<body>
	<%@ include file="../components/admin_home_nav.jsp"%>

	<%
	AppointmentDao ad = new AppointmentDao();
	List<Appointment> list = ad.fetchAll();
	%>

	<h1 class="text-center">Welcome to Admin Home</h1>
	
	<div class="card ps-4" style="width: 18rem">
		<img src="..." class="card-img-top" alt="...">
		<div class="card-body">
		  <h3>Number of Appointments : </h3>
		  <h3><%=list.size() %></h3>
		</div>
	</div>

</body>
</html>