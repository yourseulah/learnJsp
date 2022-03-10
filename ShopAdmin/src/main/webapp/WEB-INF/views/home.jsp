<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>The time on the server is ${serverTime}. </P>
<p>아이디 : ${a_id}</p>
<p><a href="/admin/logout">[로그아웃]</a></p>
<p><a href="/admin/login">[로그인]</a></p>
</body>
</html>
