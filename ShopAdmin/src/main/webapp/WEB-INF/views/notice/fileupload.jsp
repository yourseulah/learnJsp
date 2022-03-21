<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/js/demo/datatables-demo.js"></script>
<head>

<script>
	function winclose() {
		opener.location.reload(); //부모창 갱신
		window.close();
	}
</script>
</head>
<body>
	<h4>Upload the file</h4>

	<form method="post" action="/notice/update"
		enctype="multipart/form-data">
		<div class="col-auto">
		 	<label for="formFile" class="form-label">No. : </label> 
			<input type="text" class="form-control" name="n_num" value="${n_num}" readonly>
			<br>  
				
			<label for="formFile" class="form-label">Select	a file : </label> 
			<input type="file" class="form-control" id="formFile" name="n_file"> 
			<br> 
			
			<input type="submit" class="btn btn-secondary" value="Save"> 
			<a href="javascript:winclose()" class="btn btn-secondary">Close</a>
		</div>
	</form>

</body>
</html>
