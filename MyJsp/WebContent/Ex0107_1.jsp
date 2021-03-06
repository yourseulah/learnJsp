<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <!-- 상단에서 import구문을 적어줘야 로드 가능 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 테스트</title>
</head>
<body>
	<h1>JDBC 테스트</h1>
	
<% 

//하기 3가지 항상 선언
	Connection conn = null; //접속객체 선언
	PreparedStatement pstmt = null; //쿼리객체 선언
	ResultSet rs = null; // 쿼리결과(레코드집합)객체 선언
	String query = ""; //SQL 문법 선언, 초기화
try {
	Class.forName("com.mysql.jdbc.Driver"); //JDBC 드라이버 로드 Driver의 D대문자 주의! 
		//out.print("드라이버 로드 성공");
		String url = "jdbc:mysql://localhost:3306/mysql"; //접속url, 맨 뒤에 mysql은 db이름이다.
		String user = "root"; //// 원칙상 아이디와 비번은 반드시 설정 해줘야 하지만, 학습용이니까 기본 설정
		String passwd = "";
		conn = DriverManager.getConnection(url, user, passwd); //DB에 연결 (conn객체 생성)
		//out.print(conn); 
		query = "select * from tblboard";
		pstmt = conn.prepareStatement(query); //쿼리객체 생성
		rs = pstmt.executeQuery(); //쿼리 실행해서 결과를 rs에 반환받음
		//rs 객체는 여러개의 레코드가 포함되어 있을 수 있다 (반복구문 필요)
		while (rs.next()) { //next 함수: 참일 경우 레코드가 반환됨
			int b_num = rs.getInt("b_num");
			String b_subject = rs.getString("b_subject");
			String b_name = rs.getString("b_name");
			String b_contents = rs.getString("b_contents");
			Date b_date = rs.getDate("b_date"); //sql 타입과 동일하게 설정. 자바에서도 date타입존재.
			
			out.print(b_num + "==" + b_subject + "==" + b_name + "==" + b_contents + "==" + b_date + "<br>");
		}
	} catch (Exception e) { //객체를 생성한 뒤에는 객체를 소멸해줘야 메모리 공간이 여유로워진다. 
		out.print(e); 
	} finally {
		try {
			if (rs != null) //제일 나중에 열린 객체부터 순서대로 닫아준다. rs가 마지막에 열렸으니 여기서는 제일 먼저 닫아준다.
				rs.close(); //close 종료!
			if (pstmt != null) 
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch ( Exception ex ) {
				out.print(ex); //파이널부터 여기까지가 객체종료구문
		}
	}

%>



</body>
</html>