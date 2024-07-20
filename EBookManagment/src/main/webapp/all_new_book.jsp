<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
    <%@page import="com.DB.DBConnect" %>
   	<%@page import="java.sql.Connection"%>
    <%@page import="com.DAO.BookDAOImpl" %>
   	<%@page import="java.util.*"%>
 	<%@page import="com.entity.Book_Details"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Book</title>
<%@include file="all_component/allCss.jsp" %>

<style type="text/css">
.crd-ho:hover{
	background-color:#fcf7f7;
}
#toast{
	min-width:300px;
	position:fixed;
	bottom:30px;
	left:50%;
	margin-left:-125px;
	background:#333;
	padding:10px;
	color:white;
	text-align:center;
	z-index:1;
	font-size:18px;
	visibility:hidden;
	box-shadow:0px 0px 100px #000;
}

#toast.display{
	visibility:visible;
	animation:fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn{ 
	from { 
		bottom:0;
		opacity:1;
	}
	to{
		bottom:30px;
		opacity:1;
	}
}

@keyframes fadeOut{ 
	from { 
		bottom:30px;
		opacity:1;
	}
	to{
		bottom:0;
		opacity:0;
	}
}

</style>
</head>


<body>
<%@include file="all_component/navbar.jsp" %>

<c:if test="${not empty failedmsg}">
		<div class="alert alert-danger text-center" role="alert">${failedmsg}</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>

	<c:if test="${not empty addcart}">
	<div class="alert alert-success text-center" role="alert">${addcart}</div>
		<c:remove var="succmsg" scope="session" />
	<!-- <div id="toast">${addcart}</div>
		
		<script type="text/javascript">
			showToast();
			function showToast(content){
				$('#toast').addClass("display");
				$('#toast').html(content);
				setTimeout(()=>{
					$("#toast").removeClass("display");
				},2000}
			}
		</script> -->
			<c:remove var="addcart" scope="session"/>
	</c:if>
	

<%User u=(User)session.getAttribute("userobj"); %>
<div class="container">
	<div class="row p-3">
		<%
		BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
		List<Book_Details> list1=dao2.getAllNewBook();
		for(Book_Details b:list1)
		{%>
		<div class="col-md-3">
		<div class="card crd-ho mt-2">
			<div class="card-body text-center">
				<img alt="" src="book/<%=b.getPhotoname() %>" style="width:8rem; height:10rem;" class="img-thumblin">
				<p><%=b.getBookname() %></p>
				<p><%=b.getAuthor() %></p>
				<p>
				Category:<%=b.getBookCategory() %></p>
				<div class="row">
				<%if(u==null){ %>
					<a href="login.jsp" class="btn btn-primary btn-sm ml-2">Add Cart</a>
				<%} else{%>
					<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-primary btn-sm ml-2">Add Cart</a>
				<%} %>
				
				<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-primary btn-sm ml-2">View</a>
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