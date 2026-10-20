<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
</head>
<body>

	<div class="container2">
		<h2>회원가입 페이지</h2>		
		<!--
			form안의 action의 역할 : 이 페이지에서 작성한 정보를 action에서 지정한 파일로 떠넘겨주는 기술 공산
			form안의 method는 전송 방식 의미: get, post
			get 방식 : 웹 페이지에서 입력받은 정보를 url에 값이 출력됨
			post 방식: 웹 페이지에서 입력받은 정보를 url에 숨겨서 출력됨 
			submit : 전송버튼 클릭하면 action의 RequestLoginProc.jsp 가 실행됨(이동)  
		-->		
		<form action="RequestJoinProc.jsp" method="post">
			<table width="500" border="1">
			
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<td width="350">
						<input type="text" name="id" placeholder="아이디를 입력하세요.">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">비밀번호</td>
					<td width="350">
						<input type="password" name="pass" placeholder="영문과 숫자만 입력하세요." >
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">비밀번호 확인</td>
					<td width="350">
						<input type="password" name="passchk" placeholder="비밀번호를 다시 입력하세요.">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">Email</td>
					<td width="350">
						<input type="email" name="email" placeholder="@를 포함하여 입력하세요.">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">전화번호</td>
					<td width="350">
						<input type="tel" name="tel" placeholder="010-0000-0000 형식으로 입력하시오">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">관심분야</td>
					<td width="350">
						<input type="checkbox" name="hobby" value="캠핑" id="camping">
						<label for="camping">캠핑</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="등산" id="mount">
						<label for="mount">등산</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="영화" id="movie">
						<label for="movie">영화</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="독서" id="book">
						<label for="book">독서</label>&nbsp;&nbsp;												
					</td>					
				</tr>
				
				<tr height="50">
					<td width="150" align="center">직업</td>
					<td width="350">
						<select name="job">
							<option value="교사">교사</option>
							<option value="변호사">변호사</option>
							<option value="의사">의사</option>
							<option value="개발자">개발자</option>
						</select>
					</td>
				</tr>
				
				<tr height="50">
					<td align="center" width="150">연령</td>
					<td width="350">
						<input type="radio" name="age" value="10대" id="teenage">
						<label for="tennage">10대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="20대" id="twenty">
						<label for="twenty">20대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="30대" id="thirty">
						<label for="thirty">30대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="40대" id="fourty">
						<label for="fourty">40대</label>&nbsp;&nbsp;												
					</td>					
				</tr>
				<tr height="50">
					<td align="center" width="150">남기는 말</td>
					<td width="350">
						<textarea rows="5" cols="40" name="info"></textarea>
					</td>
				</tr>
				<tr height="50">					
					<td colspan="2" align="center" width="150">
						<input type="submit" value="회원가입">
						<input type="reset" value="초기화">
					</td>					
				</tr>
			</table>
		</form>	
	</div>
	
</body>
</html>