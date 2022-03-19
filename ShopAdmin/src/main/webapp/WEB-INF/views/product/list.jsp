<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Product List</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-dark"><a href="/product/insert">New</a></h6>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>Product Code</th>
							<th>Product Name</th>
							<th>Unit Price</th>
							<th>Image</th>
							<th>Updated Date</th>
							<th>Edited Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="product"> 
						<!-- Controller에서 넘어온 list배열로부터 
						product변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<tr>
								<td>${product.p_code}</td>
								<td><a href="/product/view?p_code=${product.p_code}">${product.p_name}</a></td>
								<!--get방식에서는 띄어쓰기 X, &으로 여러개 넘길수도 있음-->
								<td><fmt:formatNumber value="${product.p_price}"/></td>
								<td><img src="/resources/product/${product.p_code}.jpg" height="70"></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.p_rdate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.p_udate}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- Pagination -->
				<ul align="center">
					<c:if test="${pageview.prev}">
						<a href="/product/list?pageNum=1"><i class="fa-solid fa-angles-left"></i></a> &nbsp;&nbsp;
						<a href="/product/list?pageNum=${pageview.startPage-1}"><i class="fa-solid fa-angle-left"></i></a> &nbsp;&nbsp;     
					</c:if>
					<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}">
						<c:if test="${pageview.page.pageNum == num}"><!-- 현재페이지라면 bold처리-->
							<b><a href="/product/list?pageNum=${num}">[${num}]</a></b> &nbsp;&nbsp;
						</c:if>
						<c:if test="${pageview.page.pageNum != num}"><!-- 현재페이지가 아니면 그대로-->
							<a href="/product/list?pageNum=${num}">[${num}]</a> &nbsp;&nbsp;
						</c:if>
					</c:forEach>	
					<c:if test="$pageview.next">
						<a href="/product/list?pageNum=${pageview.endPage+1}"><i class="fa-solid fa-angle-right"></i></a> &nbsp;&nbsp;
						<a href="/product/list?pageNum=${pageview.realend}"><i class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</ul>	
				
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>