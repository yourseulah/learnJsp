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
			<!-- 컨트롤러로 간다. 
			/notice/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">
			
				<!-- javascript 사용해서 제출 해보기, 
				 method="post" action="/notice/insert" 지우고 name 부여-->
				<form class="user" name="writefrm">
					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
						<label>제목</label>
							<input type="text" id="id_subject" class="form-control form-control-user"
							 name="n_subject" placeholder="제목">
						</div>
						<div class="col-sm-6">
						<label>작성자</label>
							<input type="text" class="form-control form-control-user"
								name="n_name" placeholder="작성자">
						</div>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="10" class="form-control" name="n_contents"
							placeholder="내용"></textarea>
					</div>

					<input type="button" class="btn btn-primary btn-user btn-block" 
					onclick="writeform();" value="Post">
					<!-- type을 submit에서 button으로 처리하고 javascript onclick 사용해보기 -->
					<a href="javascript:writeform2();">글쓰기2</a> 
					<!-- button이 아닌 hyperlink도 가능, javascript를 링크로 호출하겠다는 것 -->
					
					<!-- 수많은 제어를 하고 싶을때 type="submit" 이 아니라 javascript로 할수 있다. -->
				</form>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>