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
			<h6 class="m-0 font-weight-bold text-primary"><a href="/member/insert">Register</a></h6>
		<!-- 컨트롤러로 간다. /board/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>아이디</th>
							<th>패스워드</th>
							<th>이름</th>
							<th>등록일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="member"> 
						<!-- Controller에서 넘어온 list배열로부터 board변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<tr>
								<td><a href="/member/view?m_id=${member.m_id}">${member.m_id}</a></td>
								<td>${member.m_passwd}</td>
								<!--get방식에서는 띄어쓰기 X, &으로 여러개 넘길수도 있음-->
								<td>${member.m_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_rdate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_udate}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>