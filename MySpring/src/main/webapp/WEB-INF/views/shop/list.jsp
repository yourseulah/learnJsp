<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Cart List</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><a href="/product/insert">Register</a></h6>
		<!-- 컨트롤러로 간다. /product/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0" align: center;>

					<tbody>
						<!-- JSTL 반복문 사용 -->
						<c:set var="cnt" value="0" /> <!-- 아직 몇개인지 모르니까 변수선언 -->
						<c:forEach items ="${list}" var="product" > <!-- Controller에서 넘어온 넘어온 list배열로부터 product변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<c:choose>
							<c:when test="${cnt % 3 == 0}"> <!-- 3으로 나눈 나머지가 0인그룹 -->
							<tr>
								<td align="center" width="33.33%" >
								<table style="text-align: center">
									<tr><td>상품코드 : ${product.p_code}</td><tr>
									<tr><td>상품이름 : ${product.p_name}</td><tr>
									<tr><td><img src="/resources/product/${product.p_code}.jpg" width="230" height="300"></td></tr>
									<tr><td>상품가격 : <fmt:formatNumber value="${product.p_price}" /></td><tr>
									<tr>
										<td>
										<form method="post" action="/shop/cart">
											<input type="hidden" name="p_code" value="${product.p_code}">
											<select name="cs_cnt">
												<c:forEach var="count" begin="0" end="30" step="1">
												<option value="${count}">${count}개</option>
												</c:forEach>
											</select> &nbsp;&nbsp;
											<input type="submit" value="장바구니">
										</form>
										</td>
									</tr>
								
								</table>
								</td>
							</c:when>
							
							<c:when test="${cnt % 3 == 2}">	 <!-- 3으로 나눈 나머지가 2인그룹 -->
								<td align="center" width="33.33%" >
								<table style="text-align: center">
									<tr><td>상품코드 : ${product.p_code}</td><tr>
									<tr><td>상품이름 : ${product.p_name}</td><tr>
									<tr><td><img src="/resources/product/${product.p_code}.jpg" width="230" height="300"></td></tr>
									<tr><td>상품가격 : <fmt:formatNumber value="${product.p_price}" /></td><tr>
									<tr>
										<td>
										<form method="post" action="/shop/cart">
											<input type="hidden" name="p_code" value="${product.p_code}">
											<select name="cs_cnt">
												<c:forEach var="count" begin="0" end="30" step="1">
												<option value="${count}">${count}개</option>
												</c:forEach>
											</select> &nbsp;&nbsp;
											<input type="submit" value="장바구니">
										</form>
										</td>
									</tr>
								</table> 
								</td>
							</tr>
							</c:when>
							
							<c:otherwise> <!-- 3으로 나눈 나머지가 1인그룹 -->
								<td align="center" width="33.33%" >
								<table style="text-align: center">
									<tr><td>상품코드 : ${product.p_code}</td><tr>
									<tr><td>상품이름 : ${product.p_name}</td><tr>
									<tr><td><img src="/resources/product/${product.p_code}.jpg" width="230" height="300"></td></tr>
									<tr><td>상품가격 : <fmt:formatNumber value="${product.p_price}" /></td><tr>
									<tr>
										<td>
										<form method="post" action="/shop/cart">
											<input type="hidden" name="p_code" value="${product.p_code}">
											<select name="cs_cnt">
												<c:forEach var="count" begin="0" end="30" step="1">
												<option value="${count}">${count}개</option>
												</c:forEach>
											</select> &nbsp;&nbsp;
											<input type="submit" value="장바구니">
										</form>
										</td>
									</tr>
								</table>  
								</td>
							</c:otherwise>
							
							</c:choose>
							
							<c:set var="cnt" value="${cnt+1}" /> <!-- cnt = cnt + 1 -->
						</c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>