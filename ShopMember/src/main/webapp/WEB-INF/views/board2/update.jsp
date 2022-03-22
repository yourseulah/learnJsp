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
				<a href="/board2/list?pageNum=${page.pageNum}">Back to List</a>
			</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<form class="user" method="post" action="/board2/update?pageNum=${page.pageNum}" enctype="multipart/form-data">
				<!-- post방식이라도 get방식으로 (링크) 넘길수 있다 혼합형 -->
					<div class="form-group row">
						<div class="col-md-2">
							<label><b>No.</b></label> 
							<input type="text"
								class="form-control" name="b_num"
								value="${board.b_num}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-4">
							<label><b>Title</b></label> 
							<input type="text"
								class="form-control" name="b_subject"
								value="${board.b_subject}">
						</div>
						<div class="col-md-4">
							<label><b>Writer</b></label> 
							<input type="text"
								class="form-control" name="b_name"
								value="${board.b_name}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-8">
							<label for="content" class="form-label"><b>Content</b></label>
							<textarea rows="10" class="form-control" name="b_contents" id="contnet">${board.b_contents}</textarea>
						</div>
					</div>
					
					<div class="form-group row">				
						<div class="input-group mb-2 col-md-4">
  							<input type="text" class="form-control" name="b_file" value="${board.b_file}" readonly>
						</div> 
						<!-- 이게 먼저 나와야함. -->
						
						<div class="input-group mb-2 col-md-4">
  							<input type="file" class="form-control" name="b_file" id="inputGroup">
 					 		<label class="input-group-text" for="inputGroup">Upload</label>
						</div>
					</div>
					
					<div class="form-group row">
						<div class="mb-1 col-md-8">
							<label><b>Written Date :</b></label> 
							${board.b_rdate}
						</div>
						<div class="mb-1 col-md-8">
							<label><b>Updated Date :</b></label> 
							${board.b_udate}
						</div>
					</div>

					<input type="submit" class="mb-4 btn btn-primary"
						value="Save">
				</form>

			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>