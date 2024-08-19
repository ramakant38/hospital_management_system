<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../components/bootstrap_css.jsp" %>
</head>
<body>
<%@ include file="../components/index_navbar.jsp" %>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="car paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>
						<c:if test="${not empty invalid}">
							<h2>${invalid}</h2>
						</c:if>
						<%-- <%
						String str3 = (String) session.getAttribute("failed");
						if (str3 != null) {
						%>
						<p class="text-center  text-danger">
							<%=str3%></p>
						<%
						session.removeAttribute("failed");
						}
						%><%
						String str1 = (String) session.getAttribute("success");
						if (str1 != null) {
						%>
						<p class="text-center text-primary fs-3">
							<%=str1%></p>
						<%
						session.removeAttribute("success");
						}
						%> --%>
						<form action="doctor_login" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input
									name="email" type="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password" class="form-control" required>
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>