<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Section-->
<section class="py-5 px-4 px-lg-5 mt-2">
    
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800" >${carttotal.m_id}'s Cart</h1>
<p class="mb-4"></p>

<!-- DataTales Example -->
<!-- <div class="card shadow mb-4"> -->	
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
  	<c:forEach items="${list}" var="cartsub">
    <tr>
      <th scope="row">${cartsub.cs_code}</th>
      <th>${cartsub.p_code}</th>
      <td>${cartsub.p_name}</td>
      <td><img src="http://localhost:8081/resources/product/${cartsub.p_code}.jpg" height="50"></td>
      <td><fmt:formatNumber value="${cartsub.p_price}" /></td>
      <td>
		<form method="post" action="/shop/cartupdate">
			<input type="hidden" name="cs_code" value="${cartsub.cs_code}">
			<select name="cs_cnt" class="btn btn-light">
			<c:forEach var="count" begin="1" end="10" step="1">
			<c:if test="${count == cartsub.cs_cnt}">
				<option value="${count}" selected>${count}</option>
				<!-- <option value="${count}" selected>${count}</option>
				데이터베이스에 있는 값과 동일한 값을 보이게 할때 selected-->
			</c:if>
			<c:if test="${count != cartsub.cs_cnt}">
				<option value="${count}">${count}</option>
				<!-- java에는 if-else가 없으니까 이렇게 써준것임  -->
			</c:if> -
			</c:forEach>
			</select>&nbsp;
			<input type="submit" value="Edit" class="btn btn-light">
		</form>
		&nbsp;<a href="/shop/cartdelete?cs_code=${cartsub.cs_code}&cm_code=${cm_code}" style="text-decoration: none; color: black;">delete</a>
		</td>
		<td><fmt:formatNumber value="${cartsub.cs_money}" /></td>
    </tr>
   </c:forEach>
  	 <tr align = "right">
   		<td colspan="7" style="font-weight:bold">
   		총금액 : <fmt:formatNumber value="${carttotal.cm_total}" pattern="#,###"/>원
		<!-- cm_code있을때만 전체삭제나타나도록 -->
		&nbsp;
   		<c:if test="${not empty cm_code}"> <!--cm_code가 비어있지 않다면-->
		&nbsp;&nbsp;<a href = "/shop/cartdeleteall?cm_code=${cm_code}" class="btn btn-outline-secondary">Delete All</a>
		&nbsp;&nbsp;<a href = "/shop/orderinfo?cm_code=${cm_code}" class="btn btn-outline-secondary">Check Out</a>
	</c:if>

  </tbody>
</table>

   
</section>

<%@include file="../include/footer.jsp"%>