<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>

<h3> 개인 회원정보 수정</h3>
	<form action="MemberUpdateProc.jsp" method="post" name="memberUpdateForm">
	
		


<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");

	// DB 연동 시작---------------------------------------------------
	Connection con = null;
	PreparedStatement pstmt = null;
	
	System.out.println("업데이트 폼 id : " + id);
	
	
	
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
		
		if(rs.next()){%>
		<input type="hidden" name="id" value="<%=rs.getString("id")%>">
		
		<table width="400" border="1">
					
			<tr height="50">
				<td align="center" width="150" >아이디</td>
				<td width="250" ><%=rs.getString("id")%></td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150" >이메일</td>
				<td width="250" >
					<input type="email" name="email" value="<%=rs.getString("email")%>">				
				</td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150" >전화번호</td>
				<td width="250" >
					<input type="text" name="tel" value="<%=rs.getString("tel")%>">				
				</td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150" >비밀번호</td>
				<td width="250" >
					<input type="password" name="pass1" placeholder="본인의 비밀번호" >				
				</td>
			</tr>
			
			<tr height="50">
				
				<td align="center" colspan="2" >
					<input type="submit" value="회원 수정하기" onclick="updateFn()">&nbsp;
					<input type="button" value="회원 전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;				
				</td>
			</tr>
					
		<% }
		
		
		
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
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
		if(rs != null) {
			try {
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();				
			}
		}
	}

%>

			
		</table>
	</form>
	
	<script type="text/javascript">
		function updateFn() {
			let form = document.memberUpdateForm;
			form.submit();
		}		
	
	</script>	
</body>
</html>