<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Cart Info</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><a href="/shop/list">Cart List</a></h6>
		<!-- 컨트롤러로 간다. /product/list/insert.jsp 이렇게 바로 못감 -->
		</div>
	
		<div class="card-body">
		<div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
				<label>아이디</label> <input type="text"
					class="form-control form-control-user" value="${carttotal.m_id}"
				readonly>
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
				<label>사용자</label> <input type="text"
					class="form-control form-control-user" value="${carttotal.m_name}"
				readonly>
			</div>
		</div>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0" align: center;>
					<thead>
						<tr>
							<th>상세코드</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>이미지</th>
							<th>수량</th>
							<th>단가</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="cartsub"> 
						<!-- Controller에서 넘어온 list배열로부터 cart변수에 각각 저장하고 
						forEach 반복구문으로 뽑아온다 -->
							<tr>
								<td>${cartsub.cs_code}</td>
								<td>${cartsub.p_code}</td>
								<td>${cartsub.p_name}</td>
								<td><img src="/resources/product/${cartsub.p_code}.jpg" height="40"></td>
								<td>${cartsub.cs_cnt}</td>
								<td><fmt:formatNumber value="${cartsub.p_price}" /></td>
								<td><fmt:formatNumber value="${cartsub.cs_money}" /></td>
							</tr>
						</c:forEach>
							<tr align = "right">
								<td colspan="7">
									총금액 : <fmt:formatNumber value="${carttotal.cm_total}" pattern="#,###" />원
								</td>							
							</tr>
					</tbody>
				</table>
		
					<%-- <div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0" >
						<label> 총금액</label> <input type="text"
						class="form-control form-control-user" value="${carttotal.cm_total}"
						readonly>
					</div> --%>
				
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>