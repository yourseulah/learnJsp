<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">리스트</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><a href="/board/insert">게시판글쓰기</a></h6>
		<!-- 컨트롤러로 간다. /board/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board"> 
						<!-- Controller에서 넘어온 list배열로부터 board변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<tr>
								<td>${board.b_num}</td>
								<td>${board.b_subject}</td>
								<td>${board.b_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_date}"/></td>
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