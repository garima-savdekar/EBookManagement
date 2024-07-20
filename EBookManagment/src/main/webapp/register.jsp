<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Register</title>
<%@include file="all_component/allCss.jsp" %>

</head>
<body style="background-color:#dce0e6">

	

	<%@include file="all_component/navbar.jsp" %>


<div class="container p-2">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h4 class="text-center ">REGISTER</h4>
					
	<c:if test="${not empty succmsg}"></c:if>
	<p class="text-center text-success">${succmsg}</p>
	<c:remove var="succmsg" scope="session"/>
	
	<c:if test="${not empty failedmsg}"></c:if>
	<p class="text-center text-danger">${failedmsg}</p>
	<c:remove var="failedmsg" scope="session"/>
	
	<c:if test="${not empty checkmsg}"></c:if>
	<p class="text-center text-danger">${checkmsg}</p>
	<c:remove var="checkmsg" scope="session"/>
	
	<form action="register" method="post">
	 <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" 
    required="required" aria-describedby="emailHelp" 
    placeholder="Enter Full Name" name="fname">
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" 
    required="required" aria-describedby="emailHelp" 
    placeholder="Enter email" name="email">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Phone No</label>
    <input type="number" class="form-control" id="exampleInputPassword1" 
    required="required" placeholder="Enter Phone No" name="phno">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" 
    required="required" placeholder="Password" name="pass">
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1" 
    name="check">
    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
  </div>
  <button type="submit" class="btn btn-primary mt-2">Submit</button>
</form>
</div>
</div>
</div>
</div>
</div>

	

</body>
</html>