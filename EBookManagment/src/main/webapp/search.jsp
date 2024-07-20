<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.Book_Details"%>
<%@page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Books</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<Book_Details> list1 = dao2.getBookBySearch(ch);
			for (Book_Details b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 8rem; height: 10rem;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-2">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&& uid=<%=u.getId()%>"
								class="btn btn-primary btn-sm ml-2">Add Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-primary btn-sm ml-2">View</a> <a href=""
								class="btn btn-primary btn-sm ml-2"><%=b.getPrice()%><i
								class="fas fa-rupee-sign ml-2"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>