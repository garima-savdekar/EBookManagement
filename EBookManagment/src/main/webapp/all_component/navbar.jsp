<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div
	class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">

	<h5 class="my-0 mr-md-auto font-weight-big bold">
		<i class="fa-solid fa-book"></i>E-books</h5>

	<form class="form-inline my-2 my-lg-0 " action="search.jsp" method="post">
		<input class="form-control mr-sm-2" type="search" placeholder="Search"
			aria-label="Search" name="ch">
		<button class="btn my-2 my-sm-0" type="submit">
			<i class="fa-solid fa-magnifying-glass"></i>Search
		</button>
		
	</form>

	<nav class="my-2 my-md-0 mr-md-3">

		<a class="p-2 text-dark" href="index.jsp"><i
			class="fa-solid fa-house mr-2"></i> Home</a> <a class="p-2 text-dark"
			href="all_recent_book.jsp"><i class="fas fa-book-open mr-1"></i>Recent
			Books</a> <a class="p-2 text-dark" href="all_new_book.jsp"><i
			class="fas fa-book-open mr-1"></i>New Arrivals</a> <a
			class="p-2 text-dark" href="all_old_book.jsp"><i
			class="fas fa-book-open mr-1"></i>Old Books</a>
	</nav>

	<c:if test="${not empty userobj }">
		<div class="col-md-3">

			<a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i></a> <a
				href="login.jsp" class="btn btn-outline-primary"> <i
				class="fa-solid fa-user-plus"></i>${userobj.name}</a> <a
				class="btn btn-outline-primary" href="logout"> <i
				class="fas fa-sign-in-alt"></i> Logout
			</a>
		</div>
	</c:if>

	<c:if test="${empty userobj}">
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-outline-primary"><i
				class="fa-solid fa-right-to-bracket"></i> Login</a> <a
				class="btn btn-outline-primary" href="register.jsp"><i
				class="fa-solid fa-user-plus"></i> Sign up</a>
		</div>

	</c:if>

</div>

<nav class="navbar navbar-dark bg-dark">
	<div class="container custom">
			<a href="setting.jsp" class="btn ml-2"><i class="fa-solid fa-gear fa-2x settingcustom"></i></a> 
			<a href="" class="btn ml-2"><i class="fa-solid fa-square-phone fa-2x phonecustom"></i></a>
	</div>
</nav>
