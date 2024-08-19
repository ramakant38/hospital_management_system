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
<%@ include file="../components/admin_home_nav.jsp" %>
<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Add Specialist</p>

						<c:if test="${not empty success}">
						    <h4 class="text-success text-center">${success}</h4>
						</c:if>

						<form action="add_specialist" method="post">
							<div class="mb-3">
								<label class="form-label">Specialist Branch</label> <input name="name"
									type="text" class="form-control" required>
							</div>
							
							<button type="submit"
								class="btn bg-secondary text-white col-md-12">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>