<%@page import="com.entity.User"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succmsg}"></c:if>
	<p class="text-center text-success ">${succmsg}</p>
	<c:remove var="succmsg" scope="session"/>
	
	<c:if test="${not empty failedmsg}"></c:if>
	<p class="text-center text-danger ">${failedmsg}</p>
	<c:remove var="failedmsg" scope="session"/>




	<div class="container">
		<div class="row p-2">

			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success mt-2">Your Selected Item</h3>
						<table class="table table-stripped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.0;
								for (Cart c : cart) {
									totalPrice = c.getTotalprice();
								%>

								<tr>
									<th scope="row"><%=c.getBookname()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&uid=<%=c.getUid()%>&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card-body bg-white">
					<h3 class="text-center text-success">Your Details for Order</h3>

					<form action="order" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Name</label> <input type="text"
									class="form-control" id="inputEmail4" value="${userobj.name }"
									readonly="readonly" name="username" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Email</label> <input type="email"
									class="form-control" id="inputPassword4"
									value="${userobj.email }" readonly="readonly" name="email"
									required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Mobile No</label> <input type="number"
									class="form-control" id="inputEmail4" value="${userobj.phno }"
									name="phno" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Address</label> <input type="text"
									class="form-control" id="inputPassword4" name="address"
									required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Landmark</label> <input type="text"
									class="form-control" id="inputEmail4" name="landmark" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">City</label> <input type="text"
									class="form-control" id="inputPassword4" name="city" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">State</label> <input type="text"
									class="form-control" id="inputEmail4" name="state" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Pin Code</label> <input type="text"
									class="form-control" id="inputPassword4" name="pincode"
									required>
							</div>
						</div>

						<div class="form-group">
							<label>Payment Mode</label> <select class=from-control
								name="payment">
								<option value="noselect">---Select---</option>
								<option value="COD">Cash on Delivery</option>
							</select>
						</div>

						<div class="text-center">
							<button class="btn btn-warning">Order Now</button>
							<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						</div>
					</form>

				</div>
			</div>


		</div>
	</div>
</body>
</html>