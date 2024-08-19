<%@ page import="com.org.dao.UserDao"%>
<%@ page import="com.org.dto.User"%>
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
	<%@ include file="../components/user_home_nav.jsp"%>
	<%
	int uId = (int) session.getAttribute("userId");
	UserDao udao = new UserDao();
	User user = udao.fetchUser(userId);
	List<Appointment> list = user.getAppointment();
	%>
	<div class="d-flex justify-content-center">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Age</th>
					<th>Gender</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Aadhar</th>
					<th>Address</th>
					<th>Appointment Date</th>
					<th>Disease</th>
					<th>Doctor</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ap" items="<%=list%>">
					<tr>
						<td>${ap.name }</td>
						<td>${ap.age }</td>
						<td>${ap.gender }</td>
						<td>${ap.email }</td>
						<td>${ap.mobile }</td>
						<td>${ap.aadhar }</td>
						<td>${ap.address }</td>
						<td>${ap.appointmentDate }</td>
						<td>${ap.disease }</td>
						<td>${ap.doctor.name }</td>
						<c:if test="${ap.status.equals('pending')}">
							<td class="bg-warning text-dark">${ap.status}</td>
						</c:if>
						<c:if test="${ap.status.equals('accepted')}">
							<td class="bg-success text-light">${ap.status}</td>
						</c:if>
						<c:if test="${ap.status.equals('rejected')}">
							<td class="bg-danger text-light">${ap.status}</td>
						</c:if>
						<c:if test="${ap.status.equals('pending')}">
							<a class="btn btn-primary"
								href="updateEdit?id=${ap.id}" role="button">edit</a>
						</c:if>
						 <c:if test="${ap.status.equals('accepted')}">
							<a class="btn btn-primary btn-sm p-1 disabled" href="updateEdit?id=${ap.id}"
								role="button">edit</a>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>