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
	<%
		request.setCharacterEncoding("utf-8");
	
		// DB 연동 시작---------------------------------------------------
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String id = request.getParameter("id");				
		
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1q2w3e4r";		
		ResultSet rs = null;
		
		String email = "";
		String tel = "";
		String job = "";
		String age = "";
		String hobby = "";
		String info = "";
		String msg = "";
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from member where id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				email = rs.getString("email");
				tel = rs.getString("tel");
				job = rs.getString("job");
				age = rs.getString("age");
				hobby = rs.getString("hobby");
				info = rs.getString("info");				
			} else {
				msg = "해당 회원의 데이터가 존재하지 않습니다.";				
			}
			
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
		
		if(!(msg == "")) {%>
			<script type="text/javascript">
				alert(" <%= msg %> ")	
				history.go(-1);
			</script>		
		<%} else { %>
			
		
	
	
	
	
			<table width="500" border="1">
			
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<td width="350">
						<%= id %>
					</td>					
				</tr>
				
				
				<tr height="50">
					<td align="center" width="150">Email</td>
					<td width="350">
						<%= email %>
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">전화번호</td>
					<td width="350">
						<%= tel %>
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">관심분야</td>
					<td width="350">
						<%= hobby %>
					</td>					
				</tr>
				
				<tr height="50">
					<td width="150" align="center">직업</td>
					<td width="350">
						<%= job %>
					</td>
				</tr>
				
				<tr height="50">
					<td align="center" width="150">연령</td>
					<td width="350">
						<%= age %>												
					</td>					
				</tr>
				<tr height="50">
					<td align="center" width="150">남기는 말</td>
					<td width="350">
						<%= info %>	
					</td>
				</tr>
				
			</table>
	<%} %>	
		<a href="MemberList.jsp">회원 목록으로</a>
</body>
</html>