<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Details"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: AllBooks</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center">All Books</h3>

	<c:if test="${not empty succmsg}"></c:if>
	<h5 class="text-center text-success">${succmsg}</h5>
	<c:remove var="succmsg" scope="session" />

	<c:if test="${not empty failedmsg}"></c:if>
	<h5 class="text-center text-danger">${failedmsg}</h5>
	<c:remove var="failedmsg" scope="session" />

	<table class="table table-striped">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<Book_Details> list = dao.getAllBooks();
			for (Book_Details b : list) {
			%>
			<tr>
				<td><%=b.getBookid()%></td>
				<td><img src="../book/<%=b.getPhotoname()%>"
					style="width: 50px; height: 50px"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookid()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit mr-1"></i>Edit</a>
					<a href="../delete_books?id=<%=b.getBookid()%>"
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt mr-1"></i>Delete</a>
				</td>
			</tr>

			<%
			}
			%>

		</tbody>
	</table>


</body>
</html>