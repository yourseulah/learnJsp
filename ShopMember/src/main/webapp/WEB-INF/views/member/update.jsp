<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<section style="height: 65vh">
	<div class="container px-1 mt-5">
		<div
			class="row gx-3 gx-lg-2 row-cols-2 row-cols-md-3 row-cols-xl-2 justify-content-center">

			<form class="user" method="post"
					action="/member/update">
			<div class="row g-3">
				<h2>My Page</h2>

					<div class="col-md-6">
						<label class="form-label">First Name</label> <input type="text"
							class="form-control" name="m_fname" value="${member.m_fname}">
					</div>
					<div class="col-md-6">
						<label class="form-label">Last Name</label> <input type="text"
							class="form-control" name="m_lname" value="${member.m_lname}">
					</div>
					<div class="col-12">
						<label for="inputAddress" class="form-label">Full Name</label> <input
							type="text" class="form-control" name="m_name"
							value="${member.m_name}" readonly>
					</div>
					<div class="col-md-6">
						<label class="form-label">User Name</label> <input type="text"
							class="form-control" name="m_id" value="${member.m_id}" readonly>
					</div>
					<div class="col-md-6">
						<label class="form-label">Password</label> <input type="text"
							class="form-control" name="m_passwd" value="${member.m_passwd}"
							readonly>
					</div>
					<div class="col-12">
						<label class="form-label">Email</label> <input type="text"
							class="form-control" name="m_email" value="${member.m_name}">
					</div>
					<div class="col-md-6">
						<input type="submit" class="btn btn-primary" value="Save">
						<a href="/member/view?m_id=${m_id}" class="btn btn-primary">Cancel</a>
					</div>

				</form>

			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp"%>