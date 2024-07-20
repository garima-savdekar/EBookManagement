<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>


	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container mt-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary p-1">Edit Profile</h5>

						<c:if test="${not empty failedmsg}"></c:if>
						<h5 class="text-center text-danger">${failedmsg}</h5>
						<c:remove var="checkmsg" scope="session" />

						<c:if test="${not empty succmsg}"></c:if>
						<h5 class="text-center text-success">${succmsg}</h5>
						<c:remove var="succmsg" scope="session" />

						<form action="update_profile" method="post">
							
							<input type="hidden" value="${userobj.id }" name="id">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									value="${userobj.name }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									value="${userobj.email }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno"
									value="${userobj.phno }">
							</div>

							<div class="form-group">
								<label for="inputState">Password</label> <input type="password"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="pass">
							</div>

							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>