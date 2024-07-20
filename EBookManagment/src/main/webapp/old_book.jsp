<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.Book_Details"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Old Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<c:if test="${not empty succmsg}">
<div class="alert alert-success text-center">${succmsg}</div>
	<c:remove var="succmsg" scope="session"/>
</c:if>

<div class="container p-5">
<div class="row">

<table class="table table-stripped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  String email=u.getEmail();
  BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
  List<Book_Details> list=dao.getBookByOld(email,"Old");
  for(Book_Details b:list){
  %>
  <tr>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><a href="delete_old_book?email=<%=email %> && bid=<%=b.getBookid()%>" class="btn btn-sm btn-danger">Delete</td>
  	</tr>
  
  <%} %>
  
</tbody>
</table>

</div>
</div>

</body>
</html>