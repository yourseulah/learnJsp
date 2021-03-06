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
	String b_num = request.getParameter("b_num"); //Get 방식에 의한 전송
%>

	<h3>상세보기</h3>
	<a href="./list.jsp">글목록</a>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String query = "";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/mysql";
		String user = "root";
		String passwd = "";
		conn = DriverManager.getConnection(url, user, passwd);
		//out.print(conn);
		//out.print("db conn success");
		
		query = "select * from tblboard where b_num = ?" ; // ?를 사용해서 b_num에 대응하도록 설정
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, Integer.parseInt(b_num)); 
		//위에서 String b_num으로 받아왔기 때문에 
		//정수형으로 형변환 하기 위해서는 Interger.parseInt 방법으로 처리  
		
		
		rs = pstmt.executeQuery(); // 쿼리 실행해서 결과를 rs에 반환받음
		rs.next(); //첫번째 레코드로 이동
		
		//int ib_num = rs.getInt("b_num"); 
		String b_subject = rs.getString("b_subject");
		String b_name = rs.getString("b_name");
		String b_contents = rs.getString("b_contents");
		String b_date = rs.getString("b_date");
		b_contents = b_contents.replace("\n", "<br>");  // <br>로 치환해서 업데이트 
		// write.jsp에서 textarea에서는 줄바꿈이 가능한데 
		// view.jsp에서 일반적인 <td>같이 다른곳에서는 가능하지 않으므로 
		// 그걸 가능하게/연출 해주기 위해서 .relace("<br>")로 줄바꿈이 반영되도록 한다.  
%>

	<table border="1">
	<tr>
		<td align = "center" width = "150">번호</td>
		<td align="center" width="300"><%=b_num %><br></td>
	</tr>
	<tr>
		<td align="center" width="150">제목</td>
		<td align="center" width="300"><%=b_subject %></td>
	</tr>
	<tr>	
		<td align="center" width="150">작성자</td>
		<td align="center" width="300"><%=b_name %><br></td>
	</tr>	
	<tr>	
		<td align="center" width="150">내용</td>
		<td align="center" width="300"><%=b_contents %><br></td>
	</tr>	
	<tr>	
		<td align="center" width="150">작성일</td> 
		<td align="center" width="300"><%=b_date %><br></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<a href="./update.jsp?b_num=<%=b_num %>">[수정]</a> &nbsp;&nbsp;
			<a href="./delete.jsp?b_num=<%=b_num %>">[삭제]</a>
		</td>
	</tr>
	</table>
		
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