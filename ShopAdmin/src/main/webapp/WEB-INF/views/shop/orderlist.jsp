<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Order List</h1>
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
							<th>Member Id</th>
							<th>Order Date</th>
							<th>OrderS Code</th>
							<th>Product Code</th>
							<th>Product Name</th>
							<th>Product Img</th>
							<th>Unit Price</th>
							<th>Quantity</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="order">
							<!-- Controller에서 넘어온 list배열로부터 
						order변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<tr>
								<th>${order.om_code}</th>
								<th>${order.m_id}</th>
								<td>${order.om_rdate}</td>
								<th>${order.os_code}</th>
								<td>${order.p_code}</td>
								<td>${order.p_name}</td>
								<td><img
									src="/resources/product/${order.p_code}.jpg"
									height="60"></td>
								<td><fmt:formatNumber value="${order.p_price}" /></td>
								<td>${order.os_cnt}</td>
								<td><fmt:formatNumber value="${order.os_money}" /></td>
							</tr>
						</c:forEach>
						<!-- 합계는 여기서는 필요 없을것 같다 -->
						<%-- <tr align="right">
							<td colspan="10" style="font-weight: bold">총금액 : <fmt:formatNumber
									value="${ordertotal.om_total}" pattern="#,###" />원 &nbsp;
							</td>
						</tr> --%>
					</tbody>
				</table>

			<!-- Pagination-->
				<%-- <ul align="center">
					<c:if test="${pageview.prev}">
						<a href="/shop/orderlist?pageNum=1"> << </a> &nbsp;&nbsp;
						<a href="/shop/orderlist?pageNum=${pageview.startPage-1}">prev</a> &nbsp;&nbsp;
					</c:if>
					<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}">
						<c:if test="${pageview.page.pageNum == num}"> <!-- 현재페이지와 만났다 bold처리-->
							<b><a href="/shop/orderlist?pageNum=${num}">${num}</a></b>&nbsp;&nbsp;
						</c:if>
						<c:if test="${pageview.page.pageNum != num}"> <!-- 현재페이지가 아니면 그대로-->
							<a href="/shop/orderlist?pageNum=${num}">${num}</a>&nbsp;&nbsp;
						</c:if>													
					</c:forEach>
					<c:if test="${pageview.next}">
						<a href="/shop/orderlist?pageNum=${pageview.endPage+1}">next</a> &nbsp;&nbsp;
						<a href="/shop/oderlist?pageNum=${pageview.realend}"> >> </a> &nbsp;&nbsp;
					</c:if>
				</ul> --%>
 				

			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>