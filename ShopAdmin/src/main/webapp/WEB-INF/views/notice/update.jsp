<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- <script>
	function ImgWinOpen(n_num) {
		window.open("/notice/fileupload?n_num=" + n_num, "",
		"width=500, height=300, menubar=no, toobar=no, status=no, scrollbars=no,");
	}
</script> -->

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Update Post</h1>
	<p class="mb-4"></p>

	<!-- Write page Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/notice/list?pageNum=${page.pageNum}">Back to List</a>
			</h6>
			
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<form class="user" method="post" action="/notice/update?pageNum=${page.pageNum}" enctype="multipart/form-data">
					<div class="form-group row">
						<div class="col-md-2">
							<label><b>No.</b></label> 
							<input type="text"
								class="form-control" name="n_num"
								value="${notice.n_num}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-4">
						<!-- <div class="col-sm-6 mb-3 mb-sm-0"> -->
							<label for="subject" class="form-label"><b>Title</b></label> 
							<input type="text"
								class="form-control" name="n_subject"
								value="${notice.n_subject}" id="subject">
						</div>
						<div class="col-md-4">
							<label for="writer" class="form-label"><b>Writer</b></label> 
							<input type="text"
								class="form-control" name="n_name"
								value="${notice.n_name}" id="writer" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-8">
						<label for="content" class="form-label"><b>Content</b></label>
						<textarea rows="10" class="form-control" name="n_contents" id="content">${notice.n_contents}</textarea>
						</div>
					</div>
					
					<div class="form-group row">				
						<div class="input-group mb-2 col-md-4">
  							<input type="text" class="form-control" name="n_file" value="${notice.n_file}" readonly>
						</div>
			
						<div class="input-group mb-2 col-md-4">
  							<input type="file" class="form-control" name="n_file" id="inputGroup">
 					 		<label class="input-group-text" for="inputGroup">Upload</label>
						</div>
					</div>
					
					<%-- <div class="form-group row">
						<div class="mb-1 col-md-8">
							<input type="button" value="Change File" class="btn btn-secondary"
							onclick="ImgWinOpen('${notice.n_num}')" name="n_file">
						</div>
					</div> --%>
					
					<div class="form-group row">
						<div class="mb-1 col-md-8">
							<label><b>Written Date : </b></label> 
							${notice.n_rdate}
						</div>
						<div class="mb-1 col-md-8">
							<label><b>Updated Date : </b></label> 
							${notice.n_udate}
						</div>
					</div>
					
					<input type="submit" class="mb-4 btn btn-primary"
						value="Save">
				
				</form>

			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>