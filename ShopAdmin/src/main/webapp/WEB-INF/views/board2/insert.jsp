<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>


<script src="/resources/js/my.js"></script>   

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Write Post</h1>
	<p class="mb-4"></p>

	<!-- Write page Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/board2/list">Back to List</a>
			</h6>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
			
				<!-- <form class="user" method="post" action="/board2/insert" enctype = "multipart/form-data"> -->
				<!-- javascript 활용해보기 -->	
				<form class="user" name="boardfrm" enctype="multipart/form-data">
					<div class="form-group row">
						<div class="mb-3 col-md-4">
							<input type="text" class="form-control"
							 name="b_subject" id="b_subject" placeholder="Title">
						</div>
						<div class="mb-3 col-md-4">
							<input type="text" class="form-control"
								name="b_name" value="${a_name}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="mb-3 col-md-8">
							<textarea rows="10" class="form-control" name="b_contents"
							placeholder="Content"></textarea>
						</div>
					</div>
								
					<div class="form-group row">				
						<div class="input-group mb-4 col-md-8">
  							<input type="file" class="form-control" name="b_file" id="inputGroupFile02">
 					 		<label class="input-group-text" for="inputGroupFile02">Upload</label>
						</div>
					</div>
					
					<div class="form-group row">
						<div class = "mb-3 col-md-8">
						<a class="btn btn-primary" href = "javascript:boardform();">Post</a>
						<!-- input 대신에 a태그를 사용해서 폼처리해보기 -->
						
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>