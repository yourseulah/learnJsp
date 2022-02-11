<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<script>
	function ImgWinOpen(p_code) {
		window.open("/product/imgupload?p_code="+p_code,"","width=500,height=300,menubar=no,toobar=no, status=no,scrollbars=no,");
		
	}
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Product Detail</h1>
	<p class="mb-4"></p>

	<!-- Datatables Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/product/list">Back to List</a>
			</h6>
			<!-- 컨트롤러로 간다. /board/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div class="form-group row">
					<div class="col-sm-6 mb-3 mb-sm-0">
						<label>상품코드</label> <input type="text"
							class="form-control form-control-user" value="${product.p_code}"
							readonly>
					</div>
					
				</div>
				
				<div class="form-group row">
					<div class="col-sm-6 mb-3 mb-sm-0">
						<label>상품명</label> <input type="text"
							class="form-control form-control-user" value="${product.p_name}"
							readonly >
					</div>
					<div class="col-sm-6">
						<label>단가</label> <input type="text"
							class="form-control form-control-user" value="${product.p_price}"
							readonly>
					</div>
				</div>
					
				<div class="form-group row">
					<div class="col-sm-6">
						<label>이미지</label> 
						<p><img src="/resources/product/${product.p_code}.jpg" height="70"></p>
					</div>
				</div>
					<div class="form-group row">
					<div class="col-sm-6">
						<label>이미지</label> 
						<input type="button" value="이미지등록" class="form-control" onclick="ImgWinOpen('${product.p_code}')">
					</div>
				</div>				
				
				<div class="form-group row">
					<div class="col-sm-6">
						<label>등록일</label> <input type="text"
							class="form-control form-control-user" value="${product.p_rdate}"
							readonly>
					</div>
					
					<div class="col-sm-6">
						<label>수정일</label> <input type="text"
							class="form-control form-control-user" value="${product.p_udate}"
							readonly>   
					</div>
				</div> 
				
				<div class="form-group row">
					<div class="col-sm-6">
						<a href="/product/update?p_code=${product.p_code}">[Update]</a>
						&nbsp;&nbsp;&nbsp;
						<a href="/product/delete?p_code=${product.p_code}">[Delete]</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>