<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<script>
	function ImgWinOpen(p_code) {
		window.open("/product/imgupload?p_code=" + p_code, "",
		"width=500, height=300, menubar=no, toobar=no, status=no, scrollbars=no,");
	}
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Product Detail</h1>
	<p class="mb-4"></p>

	<!-- datatable Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/product/list?pageNum=${page.pageNum}">Back to List</a>
			</h6>
		</div>

		<div class="card-body" >
			<div class="table-responsive">
				<div class="form-group row">
					<div class="col-md-4">
						<label><b>Code</b></label> 
						<input type="text" class="form-control"
							value="${product.p_code}" readonly>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-4">
						<label><b>Name</b></label>
						<input type="text" class="form-control"
							value="${product.p_name}" readonly>
					</div>
					<div class="col-md-4">
						<label><b>Unit Price</b></label> 
						<input type="text" class="form-control"
							value="${product.p_price}" readonly>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<p>
							<img src="/resources/product/${product.p_code}.jpg" height="250">
						</p>
						<input type="button" value="Image" class="btn btn-secondary"
							onclick="ImgWinOpen('${product.p_code}')">
					</div>
				</div>
				
				<!-- Default switch -->
			<div class="custom-control custom-switch mb-3">
			<c:if test="${product.p_soldout == 1}">
			  <input type="checkbox" class="custom-control-input" value="${product.p_soldout}" id="customSwitches" checked>
			</c:if>
			<c:if test="${product.p_soldout == 0}">
			  <input type="checkbox" class="custom-control-input" value="${product.p_soldout}" id="customSwitches">
			</c:if>
			  <label class="custom-control-label" for="customSwitches">Sold Out</label>
			</div>
				
				<div class="form-group row">
					<div class="col-md-4">
						<label class="form-control"><b>Registered Date :</b>${product.p_rdate}</label> 
						<br>
					</div>

					<div class="col-md-4">
						<label class="form-control"><b>Edited Date : </b>${product.p_udate}</label> 
						<br>
					</div>
				</div>
				
				
				
				<div class="form-group row">
					<div class="col-sm-6">
						<a class="btn btn-primary"
							href="/product/update?p_code=${product.p_code}">Update</a>
							<%-- &nbsp;&nbsp;&nbsp; <a class="btn btn-primary"
							href="/product/delete?p_code=${product.p_code}">Delete</a> --%>
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>