<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.DAO.BookOrderDAO"%>
<%@page import="com.entity.Order_Details"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<%@ include file="navbar.jsp"%>
	<h3 class="text-center">All Orders</h3>

	<table class="table table-striped">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>

			<%
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Order_Details> list = dao.getAllOrder();
				for (Order_Details b : list) {
				%>
			<tr>
				<th scope="row"><%=b.getOrderid() %></th>
				<td><%=b.getUsername() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladdress() %></td>
				<td><%=b.getPhoneno() %></td>
				<td><%=b.getBookname() %></td>
				<td><%=b.getBookauthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
			</tr>
			<%}
			%>
		</tbody>
	</table>


</body>
</html>