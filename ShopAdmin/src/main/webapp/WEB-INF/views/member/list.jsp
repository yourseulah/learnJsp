<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Member List</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>id</th>
							<th>password</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Full Name</th>
							<th>email</th>
							<th>registered Date</th>
							<th>Updated Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="member"> 
						<!-- Controller에서 넘어온 list배열로부터 member변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<tr>
								<td><a href="/member/view?m_id=${member.m_id}">${member.m_id}</a></td>
								<td>${member.m_passwd}</td>
								<!--get방식에서는 띄어쓰기 X, &으로 여러개 넘길수도 있음-->
								<td>${member.m_fname}</td>
								<td>${member.m_lname}</td>
								<td>${member.m_name}</td>
								<td>${member.m_email}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_rdate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_udate}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- Pagination -->
				<ul align="center">
					<c:if test="${pageview.prev}">
						<a href="/member/list?pageNum=1"> << </a> &nbsp;&nbsp;
						<a href="/member/list?pageNum=${pageview.startPage-1}">prev</a> &nbsp;&nbsp;
					</c:if>
					<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}">
						<c:if test="${pageview.page.pageNum == num}"> <!-- 현재페이지와 만났다 bold처리-->
							<b><a href="/member/list?pageNum=${num}">${num}</a></b>&nbsp;&nbsp;
						</c:if>
						<c:if test="${pageview.page.pageNum != num}"> <!-- 현재페이지가 아니면 그대로-->
							<a href="/member/list?pageNum=${num}">${num}</a>&nbsp;&nbsp;
						</c:if>													
					</c:forEach>
					<c:if test="${pageview.next}">
						<a href="/member/list?pageNum=${pageview.endPage+1}">next</a> &nbsp;&nbsp;
						<a href="/member/list?pageNum=${pageview.realend}"> >> </a> &nbsp;&nbsp;
					</c:if>
				</ul>
				
				
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>