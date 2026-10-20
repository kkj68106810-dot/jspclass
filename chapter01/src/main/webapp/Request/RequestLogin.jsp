<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		width: 600px;
		margin: 20px auto;
	}
</style>
</head>
<body>

	<div class="container">
		<h2>로그인 페이지</h2>		
		<!--
			form안의 action의 역할 : 이 페이지에서 작성한 정보를 action에서 지정한 파일로 떠넘겨주는 기술 공산
			form안의 method는 전송 방식 의미: get, post
			get 방식 : 웹 페이지에서 입력받은 정보를 url에 값이 출력됨
			post 방식: 웹 페이지에서 입력받은 정보를 url에 숨겨서 출력됨 
			submit : 전송버튼 클릭하면 action의 RequestLoginProc.jsp 가 실행됨(이동)  
		-->		
		<form action="RequestLoginProc.jsp" method="post">
			<table width="600" border="1">
				<tr height="60">
					<td align="center" width="350">아이디</td>
					<td align="center" width="350">
						<input type="text" name="id">
					</td>					
				</tr>
				<tr height="60">
					<td align="center" width="350">비밀번호</td>
					<td align="center" width="350">
						<input type="password" name="pass">
					</td>					
				</tr>			
				<tr height="60">					
					<td colspan="2" align="center" width="150">
						<input type="submit" value="전송">
					</td>					
				</tr>
			</table>
		</form>	
	</div>
	
</body>
</html>