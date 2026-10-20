<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
<style type="text/css">
	.container{
		width: 600px;
		margin: 20px auto;
	}
</style>
</head>
<body>
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
		}
		
		// msg 예외처리 할 것
		if(msg != ""){ %>
	<!-- 
			history 객체는 브라우저가 현재 탭이나 창에서 방문했던 웹페이지들의 기록(Session History)을 관리하고 제어하는 객체이다.
			* history 객체의 메소드 종류
			- history.back() : 바로 이전 페이지로 이동(뒤로가기)
			- history.forward() : 앞으로 가기 
			- history.go(n) : 지정한 상대적 위치만큼 이동
				- history.go(1)은 앞으로 가기.
				- history.go(0)은 현재페이지
				- history.go(-1)은 뒤로가기
		-->
		
		
		
			<script type="text/javascript">
				alert("<%=msg%>");
				history.go(-1);
			</script>		
			
			
		<%} else { %>				
		
	<div class="container">
		<table width="500" border="1">
			
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<td width="350">
						<%=id%>
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">비밀번호</td>
					<td width="350">
						<%=pass%>
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">비밀번호 확인</td>
					<td width="350">
						<%=passchk%>
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">Email</td>
					<td width="350">
						<%=email%>
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">전화번호</td>
					<td width="350">
						<%=tel%>
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">관심분야</td>
					<td width="350">
					
					<% if(!(hobbys == null || hobbys.length == 0)) {
						for(int i = 0; i < hobbys.length; i++) {					
					%>
						<%= hobbys[i] %>						
					<%}}%>											
					</td>					
				</tr>
				
				<tr height="50">
					<td width="150" align="center">직업</td>
					<td width="350">
						<%=job%>
					</td>
				</tr>
				
				<tr height="50">
					<td align="center" width="150">연령</td>
					<td width="350">
						<%=age%>												
					</td>					
				</tr>
				<tr height="50">
					<td align="center" width="150">남기는 말</td>
					<td width="350">
						<%=info%>
					</td>
				</tr>
				
			</table>
	</div>
	<%} %>
	
</body>
</html>