<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> <!-- 상단에서 import구문을 적어줘야 로드 가능 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8"); 
	//여기서는 데이터를 넘기고 받을때 한글로처리 / 상단에 1~2라인은 이 파일 자체를 한글로처리
	String b_num = request.getParameter("b_num");
	String b_subject = request.getParameter("b_subject"); 
	String b_name = request.getParameter("b_name");
	String b_contents = request.getParameter("b_contents");
%>

<%
	Connection conn = null; //전역변수 추가(접속객체 선언) / connection객체는 내장되어 있는 기능/ 생성과 동시에 null값 부여.
	PreparedStatement pstmt = null; //쿼리객체 선언
	ResultSet rs = null; //쿼리결과(레코드집합) 객체선언
	String query = "" ; //SQL 문법선언, 초기화
	
	try { //예외가 발생할수 있는 부분
		Class.forName("com.mysql.jdbc.Driver"); // JDBC 드라이버를 로드하는 문장 Driver 대문자 주의!
		//out.print("드라이버 로드 성공");
		String url = "jdbc:mysql://localhost:3306/mysql";  // 접속url, 맨 뒤에 mysql은 db이름
		String user = "root";  
		String passwd = "";
		conn = DriverManager.getConnection(url, user, passwd);
		//out.print(conn);
		
		query = "update tblboard set b_subject = ?, b_name = ?, b_contents = ? where b_num = ?"; 
		// 데이터를 입력해야 하니까 인서트 인투 구문으로 변경
		pstmt = conn.prepareStatement(query); // 불러온 쿼리를 쿼리결과 객체로 생성
		pstmt.setString(1, b_subject);  
		pstmt.setString(2, b_name);  
		pstmt.setString(3, b_contents); 
		pstmt.setInt(4, Integer.parseInt(b_num)); //문자열이 아닌 변수 그래서 "b_num"하지 X
		pstmt.executeUpdate();  // insert, update, delete의 경우 사용 /
%>		
		<!-- 리스트 자체 이동과 javascript를 이용한 이동 방법중 선택 --> 
		<script>
			alert("수정되었습니다.");
			location.href = "./view.jsp?b_num=<%=b_num%>";
		</script>

<%
	} catch (Exception e) { //예외를 처리하는 부분
		out.print(e); 
	} finally { // 항상 수행되는 부분
		try {
			if (rs != null)  // 제일 나중에 열린 객체부터 순서대로 닫아준다. rs가 마지막에 열렸으니 여기서는 제일 먼저 닫아준다.
				rs.close();  // close, 종료!
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
			out.print(ex);   // 파이널부터 여기까지가 객체 종료 구문이다.
		}
	}

%>

</body>
</html>