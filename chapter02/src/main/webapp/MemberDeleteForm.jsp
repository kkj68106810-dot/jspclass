<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%@ page import="java.sql.*" %>

	<h2>회원정보 삭제 하기</h2>
	<form action="MemberDeleteProc.jsp" method="post" name="deleteForm" >
	

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
			<input type="hidden" name="id" value="<%=rs.getString("id")%>">
			<table width="500" border="1">					
			<tr height="50">
				<td align="center" width="150" >아이디</td>
				<td width="250" ><%=rs.getString("id")%></td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150" >비밀번호</td>
				<td width="250" >
					<input type="password" name="pass1" placeholder="본인의 비밀번호" >				
				</td>
			</tr>
			
			<tr height="50">
				
				<td align="center" colspan="2" >
					<input type="submit" value="회원 삭제하기" onclick="deleteFn()">&nbsp;
					<input type="button" value="회원 전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;				
				</td>
			</tr>
</table>				
			<% }	
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con!= null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();		
				}
			}
			if(pstmt!= null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();		
				}
			}
			if(rs!= null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	%>

		
	
			</form>
			
			
			<script type="text/javascript" >
				function deleteFn() {
					let form = document.deleteForm;
					form.submit();
				}
			
			</script>