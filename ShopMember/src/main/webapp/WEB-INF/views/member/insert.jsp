<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>


<!-- Login Section-->
<section class="vh-100">
	<div class="container px-1 mt-5">
		<!-- Page Heading -->
		<!-- <h1
			class="row gx-3 gx-lg-2 row-cols-2 row-cols-md-3 row-cols-xl-2 justify-content-center">Register</h1>
		<p class="mb-4"></p> -->
		
		<div
			class="row gx-3 gx-lg-2 row-cols-2 row-cols-md-3 row-cols-xl-2 justify-content-center">

			<form class="row g-3" method="post" action="/member/insert">

				<div class="col-md-6">
					<label for="inputEmail4" class="form-label">Email</label> <input
						type="email" class="form-control" id="inputEmail4">
				</div>
				<div class="col-md-6">
					<label for="inputPassword4" class="form-label">Password</label> <input
						type="password" class="form-control" id="inputPassword4">
				</div>
				<div class="col-12">
					<label for="inputAddress" class="form-label">Address</label> <input
						type="text" class="form-control" id="inputAddress"
						placeholder="1234 Main St">
				</div>
				<div class="col-12">
					<label for="inputAddress2" class="form-label">Address 2</label> <input
						type="text" class="form-control" id="inputAddress2"
						placeholder="Apartment, studio, or floor">
				</div>
				<div class="col-md-6">
					<label for="inputCity" class="form-label">City</label> <input
						type="text" class="form-control" id="inputCity">
				</div>
				<div class="col-md-4">
					<label for="inputState" class="form-label">State</label> <select
						id="inputState" class="form-select">
						<option selected>Choose...</option>
						<option>...</option>
					</select>
				</div>
				<div class="col-md-2">
					<label for="inputZip" class="form-label">Zip</label> <input
						type="text" class="form-control" id="inputZip">
				</div>
				<div class="col-12">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="gridCheck">
						<label class="form-check-label" for="gridCheck"> Check me
							out </label>
					</div>
				</div>
				<div class="col-12">
					<button type="submit" class="mb-3 form-control btn btn-primary">Register</button>
					<a href="/member/login" class="form-control btn btn-outline-dark">Back to Login</a>
				</div>
			</form>

		</div>
	</div>
</section>



<%@include file="../include/footer.jsp"%>