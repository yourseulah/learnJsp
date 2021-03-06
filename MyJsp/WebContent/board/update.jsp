<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8"); 
	String b_num = request.getParameter("b_num"); // 넘긴번호를 문자열로 받기 Get 방식에 의한 전송
%>

	<h3>수정하기</h3>
	<a href="./list.jsp">리스트</a>&nbsp;&nbsp;
	<a href="./view.jsp?b_num=<%=b_num%>">상세보기</a>
	<br>

<%
	Connection conn = null; //접속객체선언
	PreparedStatement pstmt = null; //쿼리객체선언
	ResultSet rs = null; //쿼리결과(레코트집합)객체선언
	String query = ""; //SQL문법선언
	try {
		Class.forName("com.mysql.jdbc.Driver"); //JDBC 드라이버 로드
		String url = "jdbc:mysql://localhost:3306/mysql"; //접속url
		String user = "root";
		String passwd = "";
		conn = DriverManager.getConnection(url, user, passwd); //DB에 연결
		//out.print(conn);
		//out.print("db conn success");
		
		query = "select * from tblboard where b_num = ?" ; // !핵심문장! ?를 사용해서 b_num에 대응하도록 설정
		pstmt = conn.prepareStatement(query); //쿼리객체생성
		pstmt.setInt(1, Integer.parseInt(b_num)); 
		//위에서 String b_num으로 받아왔기 때문에 
		//정수형으로 형변환을 해야한다. 
		//하지만 기본타입끼리는 (int)abc 가능한데 오른쪽이 객체일때는 이방법으로 할수 없다. 
		//그래서 wrapper클래스 그중 우리가 필요한것이 Integer클라스
		
		rs = pstmt.executeQuery(); // 쿼리 실행해서 결과를 rs에 반환받음
		rs.next(); //첫번째 레코드로 이동 (레코드는 단 1개만검색됨)
		
		String b_subject = rs.getString("b_subject");
		String b_name = rs.getString("b_name");
		String b_contents = rs.getString("b_contents"); //컨텐츠 그대로
		String b_date = rs.getString("b_date");
%>
	
	<form method="post" action="./update_end.jsp">
	<table border="1">
	<tr>
		<td align = "center" width = "150">번호</td>
		<td width="300"><input type="text" name="b_num" value="<%=b_num%>" readonly></td> 
		<!-- 밸류설정해서 노출을 시키면서 건드릴수 있는데 readonly로 해놓아서 건드릴수 없게  -->
	</tr>
	<tr>
		<td align="center" width="150">제목</td>
		<td width="300"><input type="text" name="b_subject" value="<%=b_subject%>"></td>
	</tr>
	<tr>	
		<td align="center" width="150">작성자</td>
		<td width="300"><input type="text" name="b_name" value="<%=b_name %>"></td>
	</tr>	
	<tr>	
		<td align="center" width="150">내용</td>
		<td width="300"><textarea cols="50" rows="10" name="b_contents"><%=b_contents %></textarea></td>
		<!-- textarea라서 b_contents = b_contents.replace("\n", "<br>"); 없음 -->
	</tr>	
	<tr>	
		<td align="center" width="150">작성일</td> 
		<td width="300"><%=b_date %></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="submit" value="수정하기">
		</td>
	</tr>
	</table>
	</form>	
	
	
<%				
	} catch (Exception e) { // 객체를 생성한 뒤에는 객체를 소멸해줘야 메모리 공간이 여유로워진다.
		out.print(e);
	} finally {
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