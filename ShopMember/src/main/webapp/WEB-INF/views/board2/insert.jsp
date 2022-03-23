<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<script src="/resources/js/my.js"></script>   

<!-- Section-->
<section class="py-5 px-5 mx-sm-5">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800" >Write Post</h1>
	<p class="mb-4"></p>

	<!-- Write page Example -->
	<div class="card shadow">
		<div class="card-header">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/board2/list" class="btn btn-primary">Back to List</a>
			</h6>
		</div>
		
		<div class="card-body" style="overflow: hidden">
			<div class="table-responsive mx-auto" style="width: 700px;">
			
				<!-- <form class="user" method="post" action="/board2/insert" enctype = "multipart/form-data"> -->
				<!-- javascript 활용해보기 -->	
				<form  name="boardfrm" enctype="multipart/form-data">
					<div class="mt-5 form-group row">
						<div class="mb-3 col-md-6">
							<input type="text" class="form-control"
							 name="b_subject" id="b_subject" placeholder="Title">
						</div>
						<div class="mb-3 col-md-6">
							<input type="text" class="form-control"
								name="b_name" value="${m_name}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="mb-3 col-md-12">
							<textarea rows="10" class="form-control" name="b_contents"
							placeholder="Content"></textarea>
						</div>
					</div>
								
					<div class="form-group row">				
						<!-- <div class="input-group mb-4 col-md-6"> -->
						<div class="mb-4 col-md-12">
  							<input type="file" class="form-control" name="b_file" >
 					 		<!-- <label class="input-group-text" for="inputGroupFile02">Upload</label> -->
						</div>
					</div>
					
					<div class="form-group row">
						<div class = "mb-5 col-md-8">
						<a class="btn btn-primary" href = "javascript:boardform();">Post</a>
						    
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

	<%@include file="../include/footer.jsp"%>