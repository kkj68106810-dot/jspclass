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
	<form action="MemberUpdateProc.jsp" method="post">
		<table width="400" border="1">


<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String pw1 = request.getParameter("pw1");
	String pass1 = request.getParameter("pass1");
	
	System.out.println("id : " + id);
	System.out.println("email : " + email);
	System.out.println("tel : " + tel);
	System.out.println("pass1 : " + pass1);
	

	// DB 연동 시작---------------------------------------------------
	Connection con = null;
	PreparedStatement pstmt = null;
	
	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root";
	String password = "1q2w3e4r";		
	ResultSet rs = null;
	String msg = "";
	
	try {
		Class.forName(driver);
		
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "select id from member where id=? and pass=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass1);
		//pstmt.setString(2, pass2);
		
		rs = pstmt.executeQuery();
		
		System.out.println("updateProc.jsp rs");
		
		if(rs.next()){	
			System.out.println("updateProc.jsp rs.next()");
			rs.close();
			pstmt.close();
			
			String updateSql = "update member set email = ?, tel = ? where id = ? ";						
			
			pstmt = con.prepareStatement(updateSql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			pstmt.setString(3, id);
			
			
			System.out.println("updateProc.jsp 쿼리성공");
			int result = pstmt.executeUpdate();
			System.out.println("updateProc.jsp result :" + result);
			
			if(result > 0) {
				msg="업데이트 성공";
			} else {
				msg="실패";
			}
			
			
		} else {
			msg = "암호를 확인하세요.";
		}
		
		
		
	}catch (Exception e) {
		e.printStackTrace();
		msg = "db오류에요";
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

<script type="text/javascript">
	alert('<%=msg%>');
	location.href="main.jsp?page=MemberList";
</script>			
			
		</table>
	</form>	
</body>
</html>