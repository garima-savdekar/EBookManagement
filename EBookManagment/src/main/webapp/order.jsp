<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.DAO.BookOrderDAO"%>
<%@page import="com.entity.Order_Details"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succmsg}">
		<div class="alert alert-success" role="alert">${succmsg}</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedmsg}">
		<div class="alert alert-danger text-center" role="alert">${failedmsg}</div>
		<c:remove var="failedmsg" scope="session" />
	</c:if>


	<div class="container p-1">
		<h3 class="text-center text-primary">Your Order</h3>
		<table class="table table-stripped mt-5">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Order_Details> list = dao.getBook(u.getEmail());
				for (Order_Details b : list) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderid()%></th>
					<td><%=b.getUsername()%></td>
					<td><%=b.getBookname()%></td>
					<td><%=b.getBookauthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>


</body>
</html>