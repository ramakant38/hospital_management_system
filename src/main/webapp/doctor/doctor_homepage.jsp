<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.org.dao.DoctorDao"%>
<%@ page import="com.org.dto.Doctor"%>
<%@ page import="java.util.List"%>
<%@ page import="com.org.dto.Appointment"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../components/bootstrap_css.jsp"%>
</head>
<body>
	<%@ include file="../components/doctor_home_nav.jsp"%>
	<h1 class="text-center">Welcome To Doctor Home Page</h1>
	<%
	int doctorId = (int)session.getAttribute("doctorId");
	DoctorDao doctorDao = new DoctorDao();
	Doctor doctor = doctorDao.fetchDoctor(doctorId);
	List<Appointment> list = doctor.getAppointment();
	%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Age</th>
				<th scope="col">Gender</th>
				<th scope="col">Email</th>
				<th scope="col">Mobile</th>
				<th scope="col">Disease</th>
				<th scope="col">Appointment Date</th>
				<th scope="col">Aadhaar</th>
				<th scope="col">Address</th>
				<th scope="col">Doctor</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="<%=list %>">
				<tr>
					<td>${i.name }</td>
					<td>${i.age }</td>
					<td>${i.gender }</td>
					<td>${i.email }</td>
					<td>${i.mobile }</td>
					<td>${i.disease }</td>
					<td>${i.appointmentDate }</td>
					<td>${i.aadhar }</td>
					<td>${i.address }</td>
					<td>${i.doctor.name }</td>
					<c:if test="${i.status.equals('pending')}">
						<td class="bg-warning text-light">${i.status}</td>
					</c:if>
					<c:if test="${i.status.equals('accepted')}">
						<td class="bg-success text-light">${i.status}</td>
					</c:if>
					<c:if test="${i.status.equals('rejected')}">
						<td class="bg-danger text-light">${i.status}</td>
					</c:if>
					<td class="d-flex"><c:if test="${i.status.equals('pending')}">
						<a class="btn btn-success"
						href="updateAccept?id=${i.id}" role="button">Accept</a>
					</c:if> 
					<c:if test="${i.status.equals('accepted')}">
						<a class="btn btn-success disabled"
						href="updateAccept?id=${i.id}" role="button" >Accept</a>
					</c:if>
					<a
						class="btn btn-danger" href="updateReject?id=${i.id}"
						role="button">Reject</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>