<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>


	<div class="joinwrap">
		<h2 style="text-align:center">회원가입 페이지</h2>	
				
		<form action="MJoinProc.do" method="post" name="mForm">
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
						<input type="password" name="passChk" placeholder="비밀번호를 다시 입력하세요.">
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
						<input type="submit" value="회원가입" onclick="checkForm()">
						<input type="reset" value="초기화">
					</td>					
				</tr>
			</table>
		</form>	
	</div>
	<!--  <a href="MemberList.jsp">회원목록보기</a> -->
	<!-- <p align="center">
		<input type="button" value="회원전체보기" onclick="location.href='main.jsp?page=MemberList'">
	</p> -->
	
	
	<script type="text/javascript">
		console.log("여기는 오니")
		function checkForm() {
			 
			
			let f = document.mForm;
			let isHobby = false;
			
			for(let i = 0; i < f.hobby.length; i++) {
				console.log(f.hobby.length)
				if(f.hobby[i].checked) {
					isHobby = true;
					return;
				}
			}
			
			
			if(f.id.value == "") {
				alert("아이디가 비었습니다.")
				f.id.focus();
				return;
			} else if (f.pass.value == "") {
				alert("비밀번호가 비었습니다.")
				f.pass.focus();
				return;
			} else if (f.email.value == "") {
				alert("이메일이 비었습니다.")
				f.email.focus();
				return;
			} else if (f.tel.value == "") {
				alert("전화번호가 비었습니다.")
				f.tel.focus();
				return;
			} else if (f.job.value == "") {
				alert("직업이 비었습니다.")
				f.job.focus();
				return;
			} else if (f.age.value == "") {
				alert("나이가 비었습니다.")
				frm.age.focus();
				return;
			} else if (f.info.value == "") {
				alert("남기는 말이 비었습니다.")
				f.info.focus();
				return;
			}
			
			if(!isHobby) {
				alert("취미가 있니?")
				f.hobby[0].checked="checked";
				return;
			}		
			
			f.submit();
		}
	</script>
	
		
