<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글입력</h3>
	<a href="./list.jsp">리스트</a>
	<form method="post" action="./write_end.jsp">
		제목 : <input type="text" name="b_subject"><br>
		작성자 : <input type="text" name="b_name"><br>
		내용 : <textarea cols="50" rows="10" name="b_contents"></textarea><br>
		
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>