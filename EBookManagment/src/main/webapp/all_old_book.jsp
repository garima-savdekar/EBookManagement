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
<title>Old Book</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>

<%@include file="all_component/navbar.jsp" %>
<style type="text/css">
.crd-ho:hover{
	background-color:#fcf7f7;
}
</style>


<div class="container">
	<div class="row p-3">
		<%
		BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
		List<Book_Details> list1=dao2.getAllOldBook();
		for(Book_Details b:list1)
		{%>
		<div class="col-md-3">
		<div class="card crd-ho">
			<div class="card-body text-center">
				<img alt="" src="book/<%=b.getPhotoname() %>" style="width:8rem; height:10rem;" class="img-thumblin">
				<p><%=b.getBookname() %></p>
				<p><%=b.getAuthor() %></p>
				<p>
				Category:<%=b.getBookCategory() %></p>
				<div class="row">
				
				<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-primary btn-sm ml-5">View</a>
				<a href="" class="btn btn-primary btn-sm ml-2"><%=b.getPrice() %><i class="fas fa-rupee-sign ml-2"></i></a>
			</div>
			</div>
		</div>
		</div>
		<%} %>
	</div>
</div>


</body>
</html>