<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록보기</title>
</head>
<body>
	<h2 align="center">가입화면 전체목록</h2>
	<%
		request.setCharacterEncoding("utf-8");
	
		// DB 연동 시작---------------------------------------------------
		Connection con = null;
		PreparedStatement pstmt = null;
		
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1q2w3e4r";		
		ResultSet rs = null;
		int count = 0;
	%>
	
	<!-- 테이블 태그 -->
	<table width="700" border="1" align="center">
		<tr height="50" border="1">
			<th>번호</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>관심분야</th>
			<th>직업</th>
			<th>연령</th>
			<th>남기는말</th>
			<th>상세보기</th>
		</tr>
	<%
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from member";
			
			pstmt = con.prepareStatement(sql);
			// rs set 객체에 담는다.
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				count++;
			%>	
				<tr height="50" border="1" align="center">
					<td><%=count%></td>
					<td><%=rs.getString("id")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("tel")%></td>
					<td><%=rs.getString("hobby")%></td>
					<td><%=rs.getString("job")%></td>
					<td><%=rs.getString("age")%></td>
					<td><%=rs.getString("info")%></td>					
					<td><a href="MemberDetail.jsp?id=<%=rs.getString("id")%>">상세보기</a></td>
				</tr>
		<%	}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			} 
			if(con != null) {
				try {
					con.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}	
	
	%>	
		
	</table>
	<a href="MemberJoin.jsp">회원가입 화면으로</a>
</body>
</html>