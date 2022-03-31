<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Section-->
<section class="py-5 px-4 px-lg-5 mt-5">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${m_id}'s Order</h1>
	<p class="mb-4"></p>

	<!-- DataTales Example -->
	<a href="/shop/list" class="btn btn-primary">Back to list</a> <br>
	<br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">OrderM Code</th>
				<th scope="col">Order Date</th>
				<th scope="col">OrderS Code</th>
				<th scope="col">Product Code</th>
				<th scope="col">Product Name</th>
				<th scope="col">Product Image</th>
				<th scope="col">Unit Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="order">
				<tr>
					<th>${order.om_code}</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${order.om_rdate}" /></td>
					<th>${order.os_code}</th>
					<td>${order.p_code}</td>
					<td>${order.p_name}</td>
					<td><img
						src="http://localhost:8081/resources/product/${order.p_code}.jpg"
						height="60"></td>
					<td><fmt:formatNumber value="${order.p_price}" /></td>
					<td>${order.os_cnt}</td>
					<td><fmt:formatNumber value="${order.os_money}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- Pagination  -->
	<ul align="center">
		<c:if test="${pageview.prev}">
			<a href="/shop/orderlist?pageNum=1"> << </a> &nbsp;&nbsp;
			<a href="/shop/orderlist?pageNum=${pageview.startPage-1}">prev</a> &nbsp;&nbsp;
		</c:if>
		<c:forEach var="num" begin="${pageview.startPage}"
			end="${pageview.endPage}">
			<c:if test="${pageview.page.pageNum == num}">
				<!-- 현재페이지와 만났다 bold처리-->
				<b><a style="text-decoration: none; color: black"
					href="/shop/orderlist?pageNum=${num}">${num}</a></b>&nbsp;&nbsp;
			</c:if>
			<c:if test="${pageview.page.pageNum != num}">
				<!-- 현재페이지가 아니면 그대로-->
				<a style="text-decoration: none; color: black"
				href="/shop/orderlist?pageNum=${num}">${num}</a>&nbsp;&nbsp;
			</c:if>
		</c:forEach>
		<c:if test="${pageview.next}">
			<a href="/shop/orderlist?pageNum=${pageview.endPage+1}">next</a> &nbsp;&nbsp;
			<a href="/shop/orderlist?pageNum=${pageview.realend}"> >> </a>&nbsp;&nbsp;
		</c:if>
	</ul>

</section>

<%@include file="../include/footer.jsp"%>