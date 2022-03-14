<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/login_header.jsp"%>


<div class="container">

	<!-- Outer Row -->
	<div class="row justify-content-center">

		<div class="col-xl-10 col-lg-12 col-md-9">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Admin Login</h1>
								</div>
								<form class="user" method="post" action="/admin/login">
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="exampleInputEmail" aria-describedby="emailHelp"
											name="a_id" placeholder="Enter ID...">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-user"
											name="a_passwd" id="exampleInputPassword"
											placeholder="Password">
									</div>
									<div class="form-group">
										<div class="custom-control custom-checkbox small">
											<input type="checkbox" class="custom-control-input"
												id="customCheck"> <label
												class="custom-control-label" for="customCheck">Remember
												Me</label>
										</div>
									</div>
									<input type="submit" class="btn btn-primary btn-user btn-block">
									
								</form>
								<hr>
							<!-- 	<div class="text-center">
									<a class="small" href="forgot-password.html">Forgot
										Password?</a>
								</div> -->
								<div class="text-center">
									<a class="small" href="register.html">Create an Account!</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>


<!--         
<!-- Begin Page Content 
<div class="container-fluid">

	<!-- Page Heading 
	<h1 class="h3 mb-2 text-gray-800">Login</h1>
	<p class="mb-4"></p>

	<!-- Write page Example 
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/admin/list">Back to List</a>
			</h6>
			<!-- 컨트롤러로 간다. /admin/list/insert.jsp 이렇게 바로 못감 
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<form class="user" method="post" action="/admin/login">
					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
						<label>아이디</label>
							<input type="text" class="form-control form-control-user"
							 name="a_id" placeholder="아이디">
						</div>
					</div>
					
					<div class="form-group row">
						<div class="col-sm-6">
						<label>패스워드</label>
							<input type="text" class="form-control form-control-user"
								name="a_passwd" placeholder="패스워드">
						</div>
					</div>
					<input type="submit" class="col-sm-6 btn btn-primary btn-user btn-block">

				</form>
			</div>
		</div>
	</div> 
 -->

<%@include file="../include/login_footer.jsp"%>