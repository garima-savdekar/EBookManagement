<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
    <%@page import="com.DB.DBConnect" %>
   <%@page import="java.sql.Connection"%>
    <%@page import="com.entity.Book_Details" %>
   <%@page import="com.DAO.BookDAOImpl"%>
    <%@page import="javax.servlet.http.HttpServlet" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Book</title>
<%@ include file="allCss.jsp" %>
<body style="background-color:#f0f2f2;">
<%@ include file="navbar.jsp" %>

	<div class=" mt-3 container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>
						

	
<%
int id=Integer.parseInt(request.getParameter("id"));
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
Book_Details b=dao.getBookById(id);%>
	
						
<form action="../editbooks" method="post">
<input type="hidden" name="id" value="<%=b.getBookid()%>">
						
						
  <div class="form-group">
    <label for="exampleInputEmail1">Book Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp" placeholder="Enter book name" 
    required="required" name="bname" value="<%=b.getBookname()%>">
   </div>
   
   <div class="form-group">
    <label for="exampleInputEmail1">Author Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp" placeholder="Enter author name" 
    required="required" name="author" value="<%=b.getAuthor()%>">
   </div>
   
   <div class="form-group">
    <label for="exampleInputEmail1">Price</label>
    <input type="number" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp" placeholder="Enter price" 
    required="required" name="price" value="<%=b.getPrice()%>">
   </div>
   
     <div class="form-group">
    <label for="inputState">Book Status</label>
    <select id="inputState" name="status" class="form-control">
    <% if("Active".equals(b.getStatus())){%>
    	 <option value="New">Active</option>
    <%
    }
    else{ %>
    <option value="New">Inactive</option>
    <%
    } 
    %>
   
    </select>
    </div>
    
   <button type="submit" class="btn btn-primary">Done</button>
   </form>
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>