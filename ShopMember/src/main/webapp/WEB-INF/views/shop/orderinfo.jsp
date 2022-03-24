<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Section-->
<section class="py-5 px-4 px-lg-5 mt-5">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${ordertotal.m_id}'s Order</h1>
	<p class="mb-4"></p> 

	<!-- DataTales Example -->
	<a href="/shop/list" class="btn btn-primary">Back to list</a>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">Cart Code</th>
				<th scope="col">Product Code</th>
				<th scope="col">Product Name</th>
				<th scope="col">Product Image</th>
				<th scope="col">Unit Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="ordersub">
				<!-- Controller에서 넘어온 list배열로부터 ordersub변수에 각각 저장하고 
	forEach 반복구문으로 뽑아온다 -->
				<tr>
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
						value="${ordertotal.om_total}" pattern="#,###" />원 
					&nbsp;
				</td>
			</tr>
		</tbody>
	</table>


</section>

<%@include file="../include/footer.jsp"%>