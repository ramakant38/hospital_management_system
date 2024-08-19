<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="components/bootstrap_css.jsp"%>
</head>
<body>
<%@ include file="../components/index_navbar.jsp" %>
<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center-primary">User Login Page</p>
						 <c:if test="${not empty fail}">
						    <h2 class="text-success text-center">${fail}</h2>
						</c:if>

						<form action="user_login" method="post">
							
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input
									name="email" type="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password" class="form-control" required>
							</div>
							<button type="submit"
								class="btn bg-primary text-white col-md-12">Login</button>
							<p>Don't have Account? <a href="user_register.jsp" style="text-decoration:'none'">Register here</a></p>
						</form>

					</div>
				</div>
				     
			</div>
		</div>
	</div>
</body>
</html>