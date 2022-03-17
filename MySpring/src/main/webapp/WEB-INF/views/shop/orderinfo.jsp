<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${ordertotal.m_id}'s Order Info</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><a href="/shop/list">Shop List</a></h6>
		<!-- 컨트롤러로 간다. -->
		</div>
	
		<div class="card-body">
		
		<div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
				<label>성함</label> <input type="text"
					class="form-control form-control-user" value="${ordertotal.m_name}"
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
							<th>단가</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="ordersub"> 
						<!-- Controller에서 넘어온 list배열로부터 ordersub변수에 각각 저장하고 
						forEach 반복구문으로 뽑아온다 -->
							<tr>
								<td>${ordersub.os_code}</td>
								<td>${ordersub.p_code}</td>
								<td>${ordersub.p_name}</td>
								<td><img src="/resources/product/${ordersub.p_code}.jpg" height="40"></td>
								<td>${ordersub.p_price}</td>
								<td>${ordersub.os_cnt}</td>
								<td><fmt:formatNumber value="${ordersub.os_money}" /></td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="7" style="font-weight:bold">
									총금액 : <fmt:formatNumber value="${ordertotal.om_total}" pattern="#,###" />원
									<!-- cm_code있을때만 전체삭제나타나도록 -->
									&nbsp;
									
								</td>							
							</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>