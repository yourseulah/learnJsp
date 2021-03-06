<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Update Post</h1>
	<p class="mb-4"></p>

	<!-- Write page Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/board/list?pageNum=${page.pageNum}">Back to List</a>
			</h6>
			<!-- 컨트롤러로 간다. /board/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<form class="user" method="post" action="/board/update?pageNum=${page.pageNum}">
				<!-- post방식이라도 get방식으로 (링크) 넘길수 있다 혼합형 -->
					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
							<label>번호</label> <input type="text"
								class="form-control form-control-user" name="b_num"
								value="${board.b_num}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
							<label>제목</label> <input type="text"
								class="form-control form-control-user" name="b_subject"
								value="${board.b_subject}">
						</div>
						<div class="col-sm-6">
							<label>작성자</label> <input type="text"
								class="form-control form-control-user" name="b_name"
								value="${board.b_name}">
						</div>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="10" class="form-control" name="b_contents">${board.b_contents}</textarea>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>작성일</label> 
							${board.b_date}
						</div>
					</div>

					<input type="submit" class="btn btn-primary btn-user btn-block"
						value="수정하기">
				</form>

			</div>
		</div>
	</div>
</div>

	<%@include file="../include/footer.jsp"%>