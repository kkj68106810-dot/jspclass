<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%@ page import="java.sql.*" %>

	<h2>회원정보 삭제 하기</h2>

	<table width="500" border="1">

	<%
		request.setCharacterEncoding("utf-8");
	
		// DB 연동 시작---------------------------------------------------
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pass1");
		
		System.out.println("id값 :" + id);
		System.out.println("pw값 :" + pw);
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1q2w3e4r";		
		ResultSet rs = null;
		String msg="";
		
		
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "delete from member where id=? and pass=?";
					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			int result =  pstmt.executeUpdate();
			
			if(result > 0) { 
			msg = "삭제에 성공하였습니다";
			
					
			
				
			} else {
				msg="비밀번호가 맞지 않습니다.";
			}
			
			
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

		
	</table>

			
	<script type="text/javascript">
		alert("<%=msg %>");
		location.href="main.jsp?page=MemberList";					
	
		</script>		
			
		