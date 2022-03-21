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
				<a href="/notice/list">Back to List</a>
			</h6>
			
		</div>
		<div class="card-body">
			<div class="table-responsive">
			
				<!-- javascript 사용해서 제출 해보기, 
				 method="post" action="/notice/insert" 지우고 name 부여-->
				<form class="user" name="writefrm" enctype="multipart/form-data">
					<div class="form-group row">
						<div class="mb-3 col-md-4">
							<input type="text" class="form-control"
							 name="n_subject" id="id_subject" placeholder="Title">
						</div>
						<div class="mb-3 col-md-4">
							<input type="text" class="form-control"
							name="n_name" value="${a_name}" readonly>
						</div>
					</div>
					<div class="form-group row">	
						<div class="mb-3 col-md-8">
						<textarea rows="10" class="form-control" name="n_contents"
						placeholder="content"></textarea>
						</div>
					</div>
					
					<div class="form-group row">				
						<div class="input-group mb-4 col-md-8">
  							<input type="file" class="form-control" name="n_file" id="inputGroup">
 					 		<label class="input-group-text" for="inputGroup">Upload</label>
						</div>
					</div>
					
					<div class="form-group row">
						<div class="mb-3 col-md-8">
							<input type="button" class="btn btn-primary" 
							onclick="writeform();" value="Post">
						</div>
					</div>
					<!-- type을 submit에서 button으로 처리하고 javascript onclick 사용해보기 -->
					
					<!-- <a href="javascript:writeform2();">글쓰기2</a> -->
					<!-- button이 아닌 hyperlink도 가능, javascript를 링크로 호출하겠다는 것 -->
					
					<!-- 수많은 제어를 하고 싶을때 type="submit" 이 아니라 javascript로 할수 있다. -->
				</form>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>