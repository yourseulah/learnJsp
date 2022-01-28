<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>    
    
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">공지리스트</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><a href="/notice/insert">게시판글쓰기</a></h6>
		<!-- 컨트롤러로 간다. /board/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="notice"> 
						<!-- Controller에서 넘어온 list배열로부터 
						notice변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<tr>
								<td>${notice.n_num}</td>
								<td><a href = "/notice/view?n_num=${notice.n_num}">${notice.n_subject}</a></td>
								<!--get방식에서는 띄어쓰기 X, 
								&으로 여러개 넘길수도 있음-->
								<td>${notice.n_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.n_date}" /></td>
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