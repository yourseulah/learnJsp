<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Update Product</h1>
	<p class="mb-4"></p>
	
	<!-- Write page Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/product/list?pageNum=${page.pageNum}">Back to List</a>
			</h6>
		</div>
	<div class="card-body">
		<div class="table-responsive">
			<form class="user" method="post" action="/product/update">
				<div class="form-group row">
					<div class="col-md-2">
						<label><b>Code</b></label> 
						<input type="text"
							class="form-control" name="p_code"
							value="${product.p_code}" readonly>
						</div>
				</div>
					
				<div class="form-group row">
					<div class="col-md-4">
						<label for="Name" class="form-label"><b>Name</b></label> 
						<input type="text"
								class="form-control" name="p_name"
								value="${product.p_name}" id="Name">
					</div>
						<div class="col-md-4">
							<label for="unitPrice" class="form-label"><b>Unit Price</b></label> 
							<input type="text"
								class="form-control" name="p_price"
								value="${product.p_price}" id="unitPrice">
						</div>
				</div>
				
				<!-- Default switch -->
			<div class="custom-control custom-switch mb-3">
			<c:if test="${product.p_soldout == 1}">
			 <input type="checkbox" class="custom-control-input" name="p_soldout" id="customSwitches" value="1" checked>
			 <input type="checkbox" class="custom-control-input" name="p_soldout" id="customSwitches" value="0" >
			</c:if>
			<c:if test="${product.p_soldout == 0}">
			<input type="checkbox" class="custom-control-input" name="p_soldout" id="customSwitches" value="1" checked>
			<input type="checkbox" class="custom-control-input" name="p_soldout" id="customSwitches" value="0" >
			</c:if>
			  <label class="custom-control-label" for="customSwitches">Sold Out</label>
			</div>
				
				<div class="form-group row">
					<div class="col-md-4">
						<label for="Name" class="form-label"><b>Registered Date: </b></label> 
						<input type="text" class="form-control"
							value="${product.p_rdate}" readonly>	
					</div>
					<div class="mb-2 col-md-4">
						<label for="Name" class="form-label"><b>Registered Date : </b></label> 
						<input type="text" class="form-control"
							value="${product.p_udate}" readonly>	
					</div>
				</div>
				
				<input type="submit" class="mb-3 btn btn-primary"
						value="Update">
			</form>

		</div>
	</div>
</div>
	
	
<%@include file="../include/footer.jsp"%>