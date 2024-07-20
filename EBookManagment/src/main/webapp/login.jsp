<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Login</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#dce0e6">

	<%@include file="all_component/navbar.jsp" %>


<div class="container p-2">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h4 class="text-center ">LOGIN</h4>
					
	<c:if test="${not empty failedmsg}"></c:if>
	<h5 class="text-center text-danger">${failedmsg}</h5>
	<c:remove var="failedmsg" scope="session"/>
	
	<c:if test="${not empty succmsg}"></c:if>
	<h5 class="text-center text-success">${succmsg}</h5>
	<c:remove var="succmsg" scope="session"/>
	
	
					
	<form action="login" method="post">
						
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp" 
    placeholder="Enter email" required="required" name="email">
   </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1"
     placeholder="Password" required="required" name="password">
  </div>
  
  
  
  <div class="text-center">
   <button type="submit" class="btn btn-primary">Login</button><br>
   <a href="register.jsp" >Create Account</a>
   </div>
   </form>
   
					
				</div>
			</div>
		</div>
	</div>
</div>
				
	
</body>
</html>