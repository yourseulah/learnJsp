<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Login Section-->
<section style="height: 45vh">
	<div class="container px-1 mt-5">
		<!-- Page Heading -->
		<!-- <h1
			class="row gx-3 gx-lg-2 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">Login</h1>
		<p class="mb-4"></p> -->

		<div
			class="row gx-3 gx-lg-2 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">


			<form class="user" method="post" action="/member/login">

				<div class="mb-3">
					<label for="InputId" class="form-label"><b>ID</b></label> <input
						type="text" class="form-control" id="InputId" name="m_id">
				</div>

				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label"><b>Password</b></label>
					<input type="password" class="form-control"
						id="exampleInputPassword1" name="m_passwd">
				</div>

				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input" id="remember">

					<label class="form-check-label" for="remember">Remember me</label>
				</div>

				<button type="submit" class="mb-3 form-control btn btn-primary">Sign
					in</button>
				<a href="/member/insert" class="form-control btn btn-outline-dark">Create
					Account</a>
			</form>

		</div>
	</div>
</section>



<%@include file="../include/footer.jsp"%>