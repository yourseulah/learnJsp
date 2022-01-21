<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">View Post</h1>
	<p class="mb-4"></p>

	<!-- Datatables Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/notice/list">Back to List</a>
			</h6>
			<!-- 컨트롤러로 간다. /board/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div class="form-group row">
					<div class="col-sm-6 mb-3 mb-sm-0">
						<label>번호</label> <input type="text"
							class="form-control form-control-user" value="${notice.n_num}"
							readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-6 mb-3 mb-sm-0">
						<label>제목</label> <input type="text"
							class="form-control form-control-user" value="${notice.n_subject}"
							readonly >
					</div>
					<div class="col-sm-6">
						<label>작성자</label> <input type="text"
							class="form-control form-control-user" value="${notice.n_name}"
							readonly>
					</div>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea rows="10" class="form-control" readonly>${notice.n_contents}</textarea>
				</div>

				<div class="form-group row">
					<div class="col-sm-6">
						<label>작성일</label> <input type="text"
							class="form-control form-control-user" value="${notice.n_date}"
							readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-6">
						<a href="/notice/update?n_num=${notice.n_num}">[수정]</a>
						&nbsp;&nbsp;&nbsp;
						<a href="/notice/delete?n_num=${notice.n_num}">[삭제]</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>