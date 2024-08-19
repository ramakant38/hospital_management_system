<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	<form:form action="registerAndUpdateDoctor" modelAttribute="doctor">
		<h3>Name :</h3>
		<form:input path="name"/>
		<h3>Email :</h3>
		<form:input path="email" type="email"/>
		<h3>Password :</h3>
		<form:input path="password" type="password"/>
		<h3>Specialist : </h3>
		<form:select path="specialist">
		   <c:forEach var="i" items="${list}">
		       <form:option value="${i.name}"></form:option>
		   </c:forEach>
		</form:select>
		<h3>Dob : </h3>
		<form:input path="dob" type="date"/>
		<h3>Experience : </h3>
		<form:input path="experience" type="number"/>
		<h3>Mobile : </h3>
		<form:input path="mobile" type="number"/>
		
		<form:button>Submit</form:button>
	</form:form>
</body>
</html>