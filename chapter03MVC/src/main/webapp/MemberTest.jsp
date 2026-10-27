<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 없는 회원 가입</title>
</head>
<body>
	<div id="testWrap">
		<h2>기본 회원가입</h2>
		<!--  form의 action은 control 부분 맵핑 -->
		<form action="Mproc.do" method="post">
			<table width="500" border="1">
				<tr height="40px">
					<td width="150">아이디</td>
					<td width="250">
						<input type="text" name="id" >
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td width="250">
						<input type="password" name="pass" >
					</td>
				</tr>
				<tr>	
					<td>이메일</td>
					<td width="250">
						<input type="email" name="email" >
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td width="250">
						<input type="text" name="tel" >
					</td>
				</tr>
				<tr>					
					<td>주소</td>
					<td width="250">
						<input type="text" name="address" >
					</td>									
				</tr>
				<tr>
					<td colspan="2" >
						<input type="submit" value="제출" >
						<input type="reset" value="초기화" >
					</td>
				</tr>
			</table>		
		</form>
	</div>
 
</body>
</html>