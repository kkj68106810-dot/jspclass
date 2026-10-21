<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 하기</title>
</head>
<body>

<h1>회원 가입하기</h1>
<%
		request.setCharacterEncoding("utf-8");
	
		// requestJoin.jsp의 입력된 정보를 requst 객체를 통해 정보를 꺼내오세요.
					
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String passchk = request.getParameter("passchk");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String job = request.getParameter("job");
		String age = request.getParameter("age");
		String[] hobbys = request.getParameterValues("hobby");
		String info = request.getParameter("info");
		
		String msg = "";
		
		
		// DB 연동 시작---------------------------------------------------
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1q2w3e4r";
		boolean isIdChk = false;
		// DB는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 오류를 찾기 어렵다.
		
		try {
			// 드라이버 로딩
			Class.forName(driver);
			// 연결
			con = DriverManager.getConnection(url, user, password);
			
			// select
			String selectMemberSql = "select id from member where id = ?";
			pstmt = con.prepareStatement(selectMemberSql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();						
			
			if(rs.next()) {
				isIdChk=true;	
			} else {						
				// insert 쿼리문 작성
				String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				pstmt.setString(3, email);
				pstmt.setString(4, tel);
				pstmt.setString(5, job);
				pstmt.setString(6, age);
				String hobby = "";
				for(String hobbyStr : hobbys) {
					 hobby +=hobbyStr + " " ;	
				}	
						
				pstmt.setString(7, hobby);
				pstmt.setString(8, info);
				int resultCount = pstmt.executeUpdate(); // 성공하면 1을 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			if(pstmt != null) {
				try {
					
				} catch(Exception e) {
					e.printStackTrace();
				}
			} else if (con != null) {
				try {
					con.close();		
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (rs != null) {
				try {
					rs.close();		
				} catch (Exception e) {
					e.printStackTrace();
				}
			}			
		}
		
		
		
		// DB 연동 종료---------------------------------------------------
		
		if(id == null || id.isEmpty()) {
			msg= "아이디를 입력하세요.";
		} else if(email.equals(null) || email.isEmpty()) {
			msg="이메일을 입력하세요.";
		} else if(pass.equals(null) || pass.isEmpty()) {
			msg="비밀번호를 입력하세요.";
		} else if(tel.equals(null) || tel.isEmpty()) {
			msg="전화번로를 입력하세요.";
		} else if(job.equals(null) || job.isEmpty()) {
			msg="직업을 입력하세요.";
		} else if(age.equals(null) || age.isEmpty()) {
			msg="나이를 입력하세요.";
		} else if(hobbys==null || hobbys.length == 0) {
			msg="취미를 입력하세요.";
		} else if(info.equals(null) || info.isEmpty()) {
			msg="남기는 말을 입력하세요.";
		} else if(!(pass.equals(passchk))) {
			msg="비밀번호가 틀립니다.";
		} else if(isIdChk) {
			msg="이미 존재하는 아이디입니다.";
		}
		
		// msg 예외처리 할 것
		if(msg != ""){ %>
		
			<script type="text/javascript">
				alert("<%=msg%>");
				history.go(-1);
			</script>		
			
			
		<%} else { %>				
		
	<div class="container">
		<h2>회원가입완료</h2>
			
				
	</div>
	<%} %>
</body>
</html>