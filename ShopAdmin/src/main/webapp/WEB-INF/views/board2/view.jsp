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
				<a href="/board2/list?pageNum=${page.pageNum}">Back to List</a>
			</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div class="form-group row">
					<div class="col-md-2">
						<label><b>No.</b></label> 
						<input type="text"
							class="form-control" value="${board.b_num}"
							readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-md-4">
						<label><b>Title</b></label> 
						<input type="text"
							class="form-control" value="${board.b_subject}"
							readonly >
					</div>
					<div class="col-md-4">
						<label><b>Writer</b></label> 
						<input type="text"
							class="form-control" value="${board.b_name}"
							readonly>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<label><b>Content</b></label>
						<textarea rows="10" class="form-control" readonly>${board.b_contents}</textarea>
					</div>
				</div>

				<div class="form-group row">
					<div class="mb-4 col-md-8">
						<label class="form-control"><b>File attached :</b>
						<a href="/board2/download?b_num=${board.b_num}">${board.b_file}</a></label>
					</div>
					<div class="col-md-8">
						<label><b>Written Date :</b></label>
						${board.b_rdate}
					</div>
					<div class="col-md-8">
						<label><b>Updated Date :</b></label>
						${board.b_udate}
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-6">
						<a class="btn btn-primary"
						href="/board2/update?b_num=${board.b_num}&pageNum=${page.pageNum}">Update</a>
						&nbsp;&nbsp;&nbsp;
						<a class="btn btn-secondary"
						href="/board2/delete?b_num=${board.b_num}">Delete</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>