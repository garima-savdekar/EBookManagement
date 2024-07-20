<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@ include file="allCss.jsp" %>
</head>
<body style="background-color:#f0f2f2;">
<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
</c:if>

	<div class=" mt-3 container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						
<c:if test="${not empty succmsg}"></c:if>
	<p class="text-center text-success">${succmsg}</p>
	<c:remove var="succmsg" scope="session"/>
	
<c:if test="${not empty failedmsg}"></c:if>
	<p class="text-center text-danger">${failedmsg}</p>
	<c:remove var="failedmsg" scope="session"/>
						
<form action="../add_books" method="post" enctype="multipart/form-data">
						
						
  <div class="form-group">
    <label for="exampleInputEmail1">Book Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp" placeholder="Enter book name" 
    required="required" name="bname">
   </div>
   
   <div class="form-group">
    <label for="exampleInputEmail1">Author Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp" placeholder="Enter author name" 
    required="required" name="author">
   </div>
   
   <div class="form-group">
    <label for="exampleInputEmail1">Price</label>
    <input type="number" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp" placeholder="Enter price" 
    required="required" name="price">
   </div>
   
   <div class="form-group">
    <label for="inputState">Book Category</label>
    <select id="inputState" name="category" class="form-control">
    <option selected>--select--</option>
    <option value="New">New Book</option>
    </select>
    </div>
    
     <div class="form-group">
    <label for="inputState">Book Status</label>
    <select id="inputState" name="status" class="form-control">
    <option selected>--select--</option>
    <option value="Active">Active</option>
    <option value="Inactive">Inactive</option>
    </select>
    </div>
    
    <div class="form-group">
    <label for="exampleInputEmail1">Upload Photo</label>
    <input type="file" class="form-control-file" id="exampleInputEmail1" 
    name="bimg">
   </div>
   
   <button type="submit" class="btn btn-primary">Add</button>
   </form>
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>