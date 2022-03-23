<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Section-->
<section class="py-5 px-5 mx-sm-5">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Update Post</h1>
	<p class="mb-4"></p>

	<!-- Write page Example -->
	<div class="card shadow">
		<div class="card-header">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/board2/list?pageNum=${page.pageNum}"
				class="btn btn-primary">Back to List</a>
			</h6>
		</div>
		<div class="card-body" style="overflow: hidden">
			<div class="table-responsive mx-auto" style="width: 700px;">

				<form class="user" method="post" action="/board2/update?pageNum=${page.pageNum}" enctype="multipart/form-data">
				<!-- post방식이라도 get방식으로 (링크) 넘길수 있다 혼합형 -->
					<div class="form-group row">
						<div class="col-md-4 mt-3">
							<label><b>No.</b></label> 
							<input type="text"
								class="form-control" name="b_num"
								value="${board.b_num}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-6 mb-3">
							<label><b>Title</b></label> 
							<input type="text"
								class="form-control" name="b_subject"
								value="${board.b_subject}">
						</div>
						<div class="col-md-6 mb-3">
							<label><b>Writer</b></label> 
							<input type="text"
								class="form-control" name="b_name"
								value="${board.b_name}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-12 mb-3">
							<label for="content" class="form-label"><b>Content</b></label>
							<textarea rows="10" class="form-control" name="b_contents" id="content">${board.b_contents}</textarea>
						</div>
					</div>
					
					<div class="form-group row">				
						<div class="input-group mb-2 col-md-4">
  							<input type="text" class="form-control" name="b_file" value="${board.b_file}" readonly>
						</div> 
						<!-- 이게 먼저 나와야함. -->
						
						<div class="input-group mb-3 col-md-4">
  							<input type="file" class="form-control" name="b_file" id="inputGroup">
 					 		<label class="input-group-text" 
 					 		for="inputGroup">Upload</label>
						</div>
					</div>
					
					<div class="form-group row">
						<div class="col-md-8 mb-1">
							<label><b>Written Date :</b></label> 
							${board.b_rdate}
						</div>
						<div class="col-md-8 mb-4">
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
</section>

<%@include file="../include/footer.jsp"%>