<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Login</h1>
	<p class="mb-4"></p>

	<!-- Write page Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/member/list">Back to List</a>
			</h6>
			<!-- 컨트롤러로 간다. /board/list/insert.jsp 이렇게 바로 못감 -->
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<form class="user" method="post" action="/member/login">
					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
						<label>아이디</label>
							<input type="text" class="form-control form-control-user"
							 name="m_id" placeholder="아이디">
						</div>
					</div>
					
					<div class="form-group row">
						<div class="col-sm-6">
						<label>패스워드</label>
							<input type="text" class="form-control form-control-user"
								name="m_passwd" placeholder="패스워드">
						</div>
					</div>
					<input type="submit" class="col-sm-6 btn btn-primary btn-user btn-block">

				</form>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>