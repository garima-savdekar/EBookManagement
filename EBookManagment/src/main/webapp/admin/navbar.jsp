<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
<div class="container-fluid" 
style="height:5px; background-color:#303f9f"></div>


<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
      <div class="container-fluid p-3" style="background-color:#FFFFFF">
      	<div class="row">
      		<div class="col-md-3 text-success justify-content-center">
      <h3 class=" test-success my-0 mr-md-auto font-weight-big bold">
      
      <i class="fa-solid fa-book"></i>E-books</h3>
      </div>
      
     
      <div class="col-3 ml-auto float-right">
      
      <c:if test="${not empty userobj }">
      
      <a class="btn btn-success text-white">
      	<i class="fas fa-user-plus"></i> ${userobj.name }</a>
      	
      	<a href="../logout" class=" btn btn-primary text-white">
      <i class="fas fa-sign-in-alt"></i> Logout</a>
     <!-- <a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i></a> -->
       </c:if>
      
      <c:if test="${ empty userobj }">
      <a href="../login.jsp" class="btn btn-success">
      	<i class="fa-solid fa-right-to-bracket"></i> Login</a>
      	
      	<a class=" btn btn-primary" href="../register.jsp">
      <i class="fa-solid fa-user-plus"></i> Sign up</a>
      </c:if>
      	
      </div>
      </div>
      </div>
      
</div>
    
    <!-- logout modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="text-center">
       <h4>Do you want logout</h4>
       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
      </div>
      </div>
      <div class="modal-footer">
        </div>
    </div>
  </div>
</div>
    
<!-- end logout modal -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> 

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
   <ul class="navbar-nav mr-auto">
   	<li class="nav-item active">
   		<a class="nav-link" href="home.jsp"><i class="fas fa-home mr-2"></i>Home
   		<span class="sr-only">(current)</span>
   		</a>
   		</li>
   		
   		</ul>
  </div>
   </nav>
   
   