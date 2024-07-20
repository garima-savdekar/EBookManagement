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
<title>EBook Index</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
body {
	margin: 0;
}

.mainsection {
	background-image: url("img/library.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	display: flex;
	height: 350px;
	width: 100vw;
}
</style>

</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="mainsection">
		<div class="mainmsg">
			<h3></h3>
		</div>
	</div>

	<!-- recent books section -->

	<div class="container text-center">
		<h3 class="text-centre">RECENT BOOKS</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<Book_Details> list = dao.getRecentBook();
			for (Book_Details b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 8rem; height: 10rem;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Category:<%=b.getBookCategory()%></p>
						<div class="row ">

							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-primary btn-sm ml-5 ">View</a> <a href=""
								class="btn btn-primary btn-sm ml-2"><%=b.getPrice()%><i
								class="fas fa-rupee-sign ml-2"></i></a>
						</div>
						<%
						} else {
						%>
						Category:<%=b.getBookCategory()%>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-2">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>" class="btn btn-primary btn-sm ml-2">Add Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-primary btn-sm ml-2">View</a> <a href=""
								class="btn btn-primary btn-sm ml-2"><%=b.getPrice()%> <i
								class="fas fa-rupee-sign ml-2"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<div class="text-center mt-3">
		<a href="all_recent_book.jsp"
			class="btn btn-danger btn-sm test-white ">View all</a>
	</div>


	<!-- End recent books section -->

	<!-- new arrivals section -->

	<div class="container text-center">
		<h3 class="text-centre">NEW BOOK</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<Book_Details> list1 = dao2.getNewBook();
			for (Book_Details b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
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
							<a href="cart?bid=<%=b.getBookid()%>&uid=<%=u.getId()%>" class="btn btn-primary btn-sm ml-2">Add Cart</a>
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
	<div class="text-center mt-3">
		<a href="all_new_book.jsp" class="btn btn-danger btn-sm test-white ">View
			all</a>
	</div>

	<!-- End new arrival section -->

	<!-- start old books section -->

	<div class="container text-center">
		<h3 class="text-centre">
			<a class="nav-link" href="all_recent_book.jsp"></a>OLD BOOKS
		</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<Book_Details> list3 = dao3.getOldBook();
			for (Book_Details b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 8rem; height: 10rem;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
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
		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm test-white">View
				all</a>
		</div>
	</div>

	<!-- End old books section -->





</body>
</html>





