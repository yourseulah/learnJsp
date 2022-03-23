<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Member Detail</h1>
	<p class="mb-4"></p>

	<!-- Datatables Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/member/list">Back to List</a>
			</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div class="form-group row">
					<div class="col-md-4">
						<label><b>ID</b></label>
						<input type="text"
							class="form-control" value="${member.m_id}"
							readonly>
					</div>
					<div class="col-md-4">
						<label><b>Password</b></label>
						<input type="text"
							class="form-control" value="${member.m_passwd}"
							readonly >
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-md-4">
						<label><b>First Name</b></label> 
						<input type="text"
							class="form-control" value="${member.m_fname}"
							readonly>
					</div>
					<div class="col-md-4">
						<label><b>Last Name</b></label> 
						<input type="text"
							class="form-control" value="${member.m_lname}"
							readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-md-8">
						<label><b>Full Name</b></label> 
						<input type="text"
							class="form-control" value="${member.m_name}"
							readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="mb-4 col-md-8">
						<label><b>Email</b></label> 
						<input type="text"
							class="form-control" value="${member.m_email}"
							readonly>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<p class="form-control"><b>Registered Date : </b>${member.m_rdate}"</p> 
					</div>

					<div class="col-md-8">
						<p class="form-control"><b>Updated Date : </b> ${member.m_udate}"</p> 
					</div>
				</div> 
				
				
				
				<div class="form-group row">
					<div class="col-sm-6">
						<a class="btn btn-primary" 
						href="/member/update?m_id=${member.m_id}">Update</a>
						&nbsp;&nbsp;&nbsp;
						<a class="btn btn-secondary"
						href="/member/delete?m_id=${member.m_id}">Delete</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>