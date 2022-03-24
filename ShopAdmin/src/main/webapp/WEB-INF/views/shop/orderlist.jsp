<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Product List</h1>
	<p class="mb-4"></p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-dark">
				<a href="/product/insert">New</a>
			</h6>
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>OrderM Code</th>
							<th>OrderS Code</th>
							<th>Product Code</th>
							<th>Product Name</th>
							<th>Unit Price</th>
							<th>Quantity</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="ordersub">
							<!-- Controller에서 넘어온 list배열로부터 
						product변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<tr>
								<th>${ordersub.om_code}</th>
								<th>${ordersub.os_code}</th>
								<th>${ordersub.p_code}</th>
								<td>${ordersub.p_name}</td>
								<td><img
									src="http://localhost:8081/resources/product/${ordersub.p_code}.jpg"
									height="60"></td>
								<td><fmt:formatNumber value="${ordersub.p_price}" /></td>
								<td>${ordersub.os_cnt}</td>
								<td><fmt:formatNumber value="${ordersub.os_money}" /></td>
							</tr>
						</c:forEach>
						<tr align="right">
							<td colspan="7" style="font-weight: bold">총금액 : <fmt:formatNumber
									value="${ordertotal.om_total}" pattern="#,###" />원 &nbsp;
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