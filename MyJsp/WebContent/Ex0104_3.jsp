<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./Ex0104_4.jsp" method="post">
	 	성명 : <input type ="text" name ="sname" required><br>
	 	나이 : <input type ="text" name ="sage"><br>
	 	지역 : <select name = "sarea">
	 		<option value = "충북">충북</option>
	 		<option value = "경기">경기</option>
	 		<option value = "서울">서울</option>
	 	</select> <br>
	 	<!-- 2000년 부터 2030년까지 syear변수로 전송할수 있는 select 태그 구현 -->
	 	
	 	년도 : <select name = "syear">
	 	<!-- java문법을 적용하기위해서 jsp 스크립트/태그를 사용 -->
	 		<% for(int i = 2000; i < 2031; i++) { %>
				 <option value ="<%=i%>"><%=i%></option> 
				 <!-- value 값을 넣어야 넘어갈수 있다 -->
				 <!-- option을 바깥에 두면 하나하나로 보이는것이 아니라 뭉터기 하나로 --> 
	 		<% } %>
	 	</select><br>
	 	
	 	취미 : <input type="radio" name ="shobby" value ="등산" >등산&nbsp;&nbsp;&nbsp;
	 	<input type="radio" name ="shobby" value ="낚시" checked>낚시&nbsp;&nbsp;&nbsp;
	 	<input type="radio" name ="shobby" value ="축구" >축구&nbsp;&nbsp;&nbsp;
	 	<!-- 배타적특성 최초의 아무것도 없는 상태로 넘어갈수 있어서 checked 표시-->
	 	<br>
	 	
	 	비빌번호 : <input type="password" name="spwd" ><br>
	 	<input type="submit" value="전송하기" >
	</form>
</body>
</html>