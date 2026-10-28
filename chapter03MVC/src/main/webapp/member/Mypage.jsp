<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="joinwrap">
		<h2 style="text-align:center">My Page</h2>	
				
		<form action="MyPageUpdate.do" method="post" name="mForm">
			<table width="500" border="1">
			
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<td width="350">
						<input type="text" name="id" readonly value="${sessionScope.id}">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">비밀번호</td>
					<td width="350">
						<input type="password" name="pass" placeholder="영문과 숫자만 입력하세요." value="${member.pass}">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">비밀번호 확인</td>
					<td width="350">
						<input type="password" name="passChk" placeholder="비밀번호를 다시 입력하세요." value="${member.pass}">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">Email</td>
					<td width="350">
						<input type="email" name="email" placeholder="@를 포함하여 입력하세요." value="${member.email}">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">전화번호</td>
					<td width="350">
						<input type="tel" name="tel" placeholder="010-0000-0000 형식으로 입력하시오" value="${member.tel }">
					</td>					
				</tr>
				
				<tr height="50">
					<td align="center" width="150">관심분야</td>
					<td width="350">
					 
							<input type="checkbox" name="hobby" value="캠핑" id="camping"  >
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
							<option value="교사" ${member.job == '교사' ? 'selected' : ''}>교사</option>
							<option value="변호사" ${member.job == '변호사' ? 'selected' : ''}>변호사</option>
							<option value="의사" ${member.job == '의사' ? 'selected' : ''}>의사</option>
							<option value="개발자" ${member.job == '개발자' ? 'selected' : ''}>개발자</option>
						</select>
					</td>
				</tr>
				
				<tr height="50">
					<td align="center" width="150">연령</td>
					<td width="350">
						<input type="radio" name="age" value="10대" id="teenage" ${member.age == '10대' ? 'checked' : '' }>
						<label for="tennage">10대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="20대" id="twenty" ${member.age == '20대' ? 'checked' : '' }>
						<label for="twenty">20대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="30대" id="thirty" ${member.age == '30대' ? 'checked' : '' }>
						<label for="thirty">30대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="40대" id="fourty" ${member.age == '40대' ? 'checked' : '' }>
						<label for="fourty">40대</label>&nbsp;&nbsp;												
					</td>					
				</tr>
				<tr height="50">
					<td align="center" width="150">남기는 말</td>
					<td width="350">
						<textarea rows="5" cols="40" name="info" ></textarea>
					</td>
				</tr>
				<tr height="50">					
					<td colspan="2" align="center" width="150">
						<input type="submit" value="수정" >
						<input type="reset" value="초기화">
					</td>					
				</tr>
			</table>
		</form>	
	</div>	
	
	<script type="text/javascript">	
		
	
		function checkForm() {
			 
			
			let f = document.mForm;
			
			
			f.submit();
		}
	</script>
	
		
