<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800" >${carttotal.m_id}'s Cart Info</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><a href="/shop/list">Shop List</a></h6>
		<!-- 컨트롤러로 간다. /product/list/insert.jsp 이렇게 바로 못감 -->
		</div>
	
		<div class="card-body">
	<%-- 	<div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
				<label>아이디</label> <input type="text"
					class="form-control form-control-user" value="${carttotal.m_id}"
				readonly>
			</div>
		</div> --%>
		
		<div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
				<label>성함</label> <input type="text"
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
							<th>단가</th>
							<th>수량</th>
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
								<td><fmt:formatNumber value="${cartsub.p_price}" /></td>
								<td>
									<form method="post" action="/shop/cartupdate">
									<input type="hidden" name="cs_code" value="${cartsub.cs_code}">
									<select name="cs_cnt">
										<c:forEach var="count" begin="1" end="30" step="1">
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
									<input type="submit" value="수정">
									</form>
									&nbsp;<a href="/shop/cartdelete?cs_code=${cartsub.cs_code}&cm_code=${cm_code}">delete</a>
								</td>
								<td><fmt:formatNumber value="${cartsub.cs_money}" /></td>
							</tr>
						</c:forEach>
							<tr align = "right">
								<td colspan="7" style="font-weight:bold">
									총금액 : <fmt:formatNumber value="${carttotal.cm_total}" pattern="#,###" />원
									<!-- cm_code있을때만 전체삭제나타나도록 -->
									&nbsp;
									<c:if test="${not empty cm_code}"> <!--cm_code가 비어있지 않다면-->
									&nbsp;&nbsp;<a href = "/shop/cartdeleteall?cm_code=${cm_code}">모두삭제</a>
									&nbsp;&nbsp;<a href = "/shop/orderinfo?cm_code=${cm_code}">주문</a>
									</c:if>
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