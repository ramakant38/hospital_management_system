<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
th {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../components/admin_home_nav.jsp"%>
	<table class="table table-info table-striped ">
		<thead>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Dob</th>
				<th>Specialist</th>
				<th>Experience</th>
				<th>Mobile</th>
				<th>Password</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${list}">
				<tr>
					<td>${i.name}</td>
					<td>${i.email }</td>
					<td>${i.dob }</td>
					<td>${i.specialist }</td>
					<td>${i.experience }</td>
					<td>${i.mobile }</td>
					<td>${i.password }</td>
					<td><a class="btn btn-primary" href="updateDoctor?id=${i.id }"
						role="button">update</a> 
						
						<a class="btn btn-danger"
						href="deleteDoctor?id=${i.id }" role="button">delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>