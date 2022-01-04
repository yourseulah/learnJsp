<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	/* Ex0104_3에서 post방식으로 받아온 내용 처리  */ 
	request.setCharacterEncoding("utf-8");// 인코딩 방식 설정 (선두열 작성) 한글 문자열 해독
	String sname = request.getParameter("sname"); //전송 문자열 저장용
	String sage = request.getParameter("sage"); //숫자로 넘긴다고 해도 문자열로 저장
	String sarea = request.getParameter("sarea");
	String syear = request.getParameter("syear");
	String shobby = request.getParameter("shobby");
	String spwd = request.getParameter("spwd");
	
	/* Wrapper 클라스를 통해 정수로 parsing */
	/* 예외가 발생할 확률이 높은 코드 - 예외처리 */
	int iage = 0; // 전역변수 선언
	boolean flag = true; //나이가 정상으로 넘어온다고 가정 
	if(sname.trim().length () < 2) { //문자열이 왼쪽과 오른쪽에 공백이 있을시 잘라버리는 메서드
		flag = false;  				// 한글이던 영어이던 모양자체로 한글자로 인식. 바이트로 인식하지 않음
									// 한글자 이면 alert 뜸	
									// 이건 예외처리가 아니라 그냥 if 구문으로 처리 
	}							
	try { //예외가 발생할수 있는 부분
		// int iage = Integer.parseInt(sage); 정수 형태의 문자열을 정수로 형변환
		// 이렇게 안에서 iage 변수를 써버리면 bracket밖에서 iage자체를 쓸수 없게 된다.
		// 따라서 밖에서 변수 선언하고 여기서는 값만 주기
		iage = Integer.parseInt(sage);
		
	} catch (Exception e) { //예외가 발생했을경우 처리할 부분
		//iage = 25;
		flag = false;
	} 
	if(flag == false) { // 예외가 발생했을경우
		
		
%>		
		
		<script>
			alert("입력오류발생.");
			history.back(); //직전페이지로 이동 
		</script>
		
<% 
	

	} else { // 정상일 경우
		/* 잘 넘어왔는지 확인용 출력 */
		out.print(sname + "<br>");
		out.print(sage + "<br>");
		out.print(sarea + "<br>");
		out.print(syear + "<br>");
		out.print(shobby + "<br>");
		out.print(spwd + "<br>");
		out.print(iage + "<br>");
	}
	//사용자에 의한 runtime 에러들,버그들, 예외를 배려하는 프로그램을 만들어야한다. 
	
%>




</body>
</html>