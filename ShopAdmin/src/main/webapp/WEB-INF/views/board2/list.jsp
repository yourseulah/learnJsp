<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Board List</h1>
	<p class="mb-4">
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><a href="/board2/insert">New</a><!-- &nbsp;${user}&nbsp;${age} --></h6>
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
							<th>파일명</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board"> 
						<!-- Controller에서 넘어온 list배열로부터 board변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
							<tr>
								<td>${board.b_num}</td>
								<td><a href="/board2/view?b_num=${board.b_num}&pageNum=${pageview.page.pageNum}">${board.b_subject}</a></td>
								<!--get방식에서는 띄어쓰기 X, &으로 여러개 넘길수도 있음-->
								<!-- page번호도 꼭 넘겨주어야 한다.  -->
								<td>${board.b_name}</td>
								<td><a href="/board2/download?b_num=${board.b_num}">${board.b_file}</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_date}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- Pagination  -->
				<ul align="center">
					<c:if test="${pageview.prev}">
						<a href="/board2/list?pageNum=1"> << </a> &nbsp;&nbsp;
						<a href="/board2/list?pageNum=${pageview.startPage-1}">prev</a> &nbsp;&nbsp;
					</c:if>
					<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}">
						<c:if test="${pageview.page.pageNum == num}"> <!-- 현재페이지와 만났다 bold처리-->
							<b><a href="/board2/list?pageNum=${num}">[${num}]</a></b>&nbsp;&nbsp;
						</c:if>
						<c:if test="${pageview.page.pageNum != num}"> <!-- 현재페이지가 아니면 그대로-->
							<a href="/board2/list?pageNum=${num}">[${num}]</a>&nbsp;&nbsp;
						</c:if>													
					</c:forEach>
					<c:if test="${pageview.next}">
						<a href="/board2/list?pageNum=${pageview.endPage+1}">next</a> &nbsp;&nbsp;
						<a href="/board2/list?pageNum=${pageview.realend}"> >> </a> &nbsp;&nbsp;
					</c:if>
				</ul>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@include file="../include/footer.jsp"%>