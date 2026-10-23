<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세</title>
</head>
<body>
	<h2>개인 회원 정보보기</h2>
	
	<table width="500" border="1">
	
	<%
		request.setCharacterEncoding("utf-8");
	
		// DB 연동 시작---------------------------------------------------
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String id = request.getParameter("id");				
		System.out.println("id값 :" + id);	
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1q2w3e4r";		
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from member where id = ?";
			
	
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();		
			
			if(rs.next()) { %>		
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="350">
					<%= rs.getString("id") %>
				</td>					
			</tr>
			
			
			<tr height="50">
				<td align="center" width="150">Email</td>
				<td width="350">
					<%= rs.getString("email") %>
				</td>					
			</tr>
			
			<tr height="50">
				<td align="center" width="150">전화번호</td>
				<td width="350">
					<%= rs.getString("tel") %>
				</td>					
			</tr>
			
			<tr height="50">
				<td align="center" width="150">관심분야</td>
				<td width="350">
					<%= rs.getString("hobby") %>
				</td>					
			</tr>
			
			<tr height="50">
				<td width="150" align="center">직업</td>
				<td width="350">
					<%= rs.getString("job") %>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150">연령</td>
				<td width="350">
					<%= rs.getString("age") %>												
				</td>					
			</tr>
			<tr height="50">
				<td align="center" width="150">남기는 말</td>
				<td width="350">
					<%= rs.getString("info") %>	
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%=rs.getString("id")%>">
					<button onclick="location.href='main.jsp?page=MemberUpdateForm&id=<%= rs.getString("id") %>'">회원수정</button>
					<button onclick="location.href='main.jsp?page=MemberDeleteForm&id=<%= rs.getString("id") %>'">회원삭제</button>
					<button onclick="location.href='main.jsp?page=MemberList'">목록보기</button>
					<button onclick="location.href='main.jsp?page=MemberJoin'">회원가입</button>
				
				</td>					
			</tr>
			<%}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		 %>
			
	
	
		
				
			</table>
		
		<a href="main.jsp?page=MemberList">회원 목록으로</a>
</body>
</html>