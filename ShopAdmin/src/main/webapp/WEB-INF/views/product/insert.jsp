<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Product Registration</h1>
	<p class="mb-4"></p>

	<!-- Write page Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/product/list">Back to List</a>
			</h6>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
				<form class="user" method="post" action="/product/insert">
					<div class="mb-3 col-md-6">
					<label for="Name"><b>Product Name</b></label> 
  					<input type="text" class="form-control" id="Name"
  					name ="p_name" placeholder="Product Name">
					</div>
					
					<div class="mb-3 col-md-6">
					<label for= "price"><b>Unit Price</b></label> 
  					<input type="text" class="form-control" id="price"
  					name ="p_price" placeholder="Unit Price">
					</div>
					
					<div class="mb-3 col-md-6">
					<label for= "stock"><b>Stock Available</b></label> 
  					<input type="text" class="mb-5 form-control" id="stock"
  					name ="p_stock" placeholder="Stock">
					</div>
					
					<div class="mb-3 col-md-6">
					<input type="submit" value="Save" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>