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
				<a href="/notice/list?pageNum=${page.pageNum}">Back to List</a>
			</h6>
			<!-- 컨트롤러로 간다. /board/list.jsp 로 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div class="form-group row">
					<div class="col-md-2">
						<label><b>No.</b></label> 
						<input type="text" class="form-control" 
						value="${notice.n_num}"	readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-md-4">
						<label><b>Title</b></label> 
							<input type="text" class="form-control" 
							value="${notice.n_subject}"	readonly>
					</div>
					<div class="col-md-4">
						<label><b>Writer</b></label> 
						<input type="text" class="form-control" 
						value="${notice.n_name}" readonly>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
					<label><b>Content</b></label>
					<textarea rows="10" class="form-control" readonly>${notice.n_contents}</textarea>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-md-8">
						<label><b>Written Date :</b></label> 
						${notice.n_date}
					</div>
				</div>
				
				<div class="form-group row">
					<div class="mb-3 col-md-8">
						<a class="btn btn-primary"
						href="/notice/update?n_num=${notice.n_num}&pageNum=${page.pageNum}">Update</a>
						&nbsp;&nbsp;&nbsp;
						<a class="btn btn-secondary"
						href="/notice/delete?n_num=${notice.n_num}">Delete</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>