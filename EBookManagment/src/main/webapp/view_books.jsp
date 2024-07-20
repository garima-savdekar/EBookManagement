<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.DB.DBConnect" %>
   	<%@page import="java.sql.Connection"%>
    <%@page import="com.DAO.BookDAOImpl" %>
   	<%@page import="java.util.*"%>
 	<%@page import="com.entity.Book_Details"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style:"background-color:#f0f1f2;">

<%@include file="all_component/navbar.jsp" %>

<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
Book_Details b=dao.getBookById(bid);
%>

<div class="container p-3">
	<div class="row">
		<div class="col-md-6 text-center p-5 border bg-white">
			<img src="book/<%=b.getPhotoname() %>" style="height:150px; width:100px"><br>
			<h4 class="mt-2">Book Name- <span class="text-success"><%=b.getBookname() %></span></h4>
			<h4>Author Name- <span class="text-success"></span><%=b.getAuthor() %></h4>
			<h4>Category- <span class="text-success"></span><%=b.getBookCategory()%></h4>
		</div>
		<div class="col-md-6 text-center p-5 border bg-white">
			<h2 class="mt-3"><%=b.getBookname() %><span class="text-success"></span></h2>
			
			<%if("Old".equals(b.getBookCategory())) {%>
			<h5 class="text-primary">Contact to Seller</h5>
			<h5 class="text-primary" ><i class="far fa-envelope"></i>Email: <%=b.getEmail() %></h5>
			<%}%>
			
			<div class="row">
			<div class="col-md-4 text-success text-center">
				<i class="fas fa-money-bill-wave fa-2x"></i>
				<p>Cash on Delivery</p>
			</div>
			<div class="col-md-4 text-danger text-center">
				<i class="fas fa-undo-alt fa-2x"></i>
				<p>Return Available</p>
			</div>
			<div class="col-md-4 text-danger text-center">
				<i class="fas fa-truck-moving fa-2x"></i>
				<p>Free Shipping</p>
			</div>
			</div>
			
			<%if("Old".equals(b.getBookCategory())) {%>
			<div class="text-center p-3">
			<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
				Continue Shopping</a>
				
			<a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i><%=b.getPrice() %></a>
			</div>
			<%}else{%>
			
			<div class="text-center p-3">
			<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
				Add Cart</a>
				
			<a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i><%=b.getPrice() %></a>
			</div>
			
			<%} %>
			
			
				
	</div>
</div>
</div>
</body>
</html>