<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<p><a href="/member/logout">로그아웃</a></p>
<h1>
	Hello world!  
</h1>

<P> The time on the server is ${serverTime}. </P>
<p> 사용자 아이디 : ${m_id} </p>
<p> 사용자 이름 : ${m_name} </p>
</body>
</html>
