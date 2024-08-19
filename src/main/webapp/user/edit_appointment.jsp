<%@ page import="com.org.dao.DoctorDao"%> 
<%@ page import="com.org.dto.Doctor" %>
<%@ page import="java.util.List" %>
<%@ page import="com.org.dto.Appointment" %>
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
	DoctorDao doctorDao = new DoctorDao();
	List<Doctor> list = doctorDao.fetchAll();
	Appointment ap = (Appointment)session.getAttribute("fetch");
	int uId = (int)session.getAttribute("userId");
	%>
	<div class="card" style="width: 35rem;">
		<div class="card-body d-flex justify-content-center">
			<form action="editAppointment" method="post">
				<label>Name : </label> <input type="text" name="name" value=<%=ap.getName()%>><br>
				<br> <label>Age : </label> <input type="text" name="age" value=<%=ap.getAge()%>><br>
				<br> <label>Gender</label> <select name="gender" value=<%=ap.getGender()%>>
					<option>Male</option>
					<option>Female</option>
					<option>Others</option>
				</select><br>
				<br> <label>Email : </label> <input type="email" name="email" value=<%=ap.getEmail()%>><br>
				<br> <label>Diseases : </label> <input type="text" name="disease" value=<%=ap.getDisease()%>><br>
				<br> <label>Appointment Date : </label> <input type="text"
					name="appointmentDate" value=<%=ap.getAppointmentDate()%>><br>
				<br> <label>Mobile : </label> <input type="text" name="mobile" value=<%=ap.getMobile()%>><br>
				<br> <label>Address : </label> <input type="text" name="address" value=<%=ap.getAddress()%>><br>
				<br> <label>Aadhaar : </label> <input type="text" name="aadhar" value=<%=ap.getAadhar() %>><br>
				<br> <label>Doctor : </label> <select name="doctorId">
					<c:forEach var="d" items="<%=list%>">
						<option value="${d.id}">${d.name}(${d.specialist})</option>
					</c:forEach>
				</select><br><br>
				<input type="hidden" name="userId" value="<%=uId%>">
				<input type="submit" value="Save Edit">
			</form>
		</div>
	</div>

</body>
</html>