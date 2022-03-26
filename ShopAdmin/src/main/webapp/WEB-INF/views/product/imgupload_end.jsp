<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<script>
			function winclose() {
				parent.opener.location.reload(); // parent: imgupload창 opener: product/view창
				window.close();
			}
		</script>
	</head>
	<body onload="winclose();"> 
	<!-- onload: Page가 나타남과동시에 처리하는 기능 : 열리자마자 닫아라 -->
	<!-- onload: body에 꼭 해줘야 한다 -->
		<h1>이동된 페이지</h1>
		
	</body>
</html>   