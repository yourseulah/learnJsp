<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<section style="height: 65vh">
	<div class="container px-1 mt-5">
		<div
			class="row gx-3 gx-lg-2 row-cols-2 row-cols-md-3 row-cols-xl-2 justify-content-center">

			<div class="row g-3">
			<h2>My Page</h2>
				<div class="col-md-6">
					<label class="form-label">First Name</label>
					<input
						type="text" class="form-control" value="${member.m_fname}" readonly>
				</div>
				<div class="col-md-6">
					<label class="form-label">Last Name</label> 
					<input
						type="text" class="form-control" value="${member.m_lname}" readonly>
				</div>
				<div class="col-12">
					<label for="inputAddress" class="form-label">Full Name</label> 
					<input
						type="text" class="form-control" value="${member.m_name}" readonly>
				</div>
				<div class="col-md-6">
					<label class="form-label">User Name</label>
					<input
						type="text" class="form-control" value="${member.m_id}" readonly>
				</div>
				<div class="col-md-6">
					<label class="form-label">Password</label> 
					<input
						type="text" class="form-control" value="${member.m_passwd}" readonly>
				</div>
				<div class="col-12">
					<label class="form-label">Email</label> 
					<input
						type="text" class="form-control" value="${member.m_email}" readonly>
				</div>
				<div class="col-md-6">
					<a href="/member/update?m_id=${m_id}" class="btn btn-primary">Edit</a>
					<a href="/shop/list" class="btn btn-primary">Cancel</a>		
				</div>
			</div>

		</div>
	</div>
</section>

<%@include file="../include/footer.jsp"%>