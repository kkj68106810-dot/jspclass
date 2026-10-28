<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/MemberList.css">

	<div id="listwrap">
	
	<form action="MemberListCon.do" method="post" class="searchbox" name="mForm">
		<select name="searchType">
			<option value="id" ${searchType == 'id' ? selected : ''}>아이디</option>
			<option value="email" ${searchType == 'email' ? selected : ''}>이메일</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어를 입력하세요." value="${keyword}">
		<input type="submit" value="검색" class="btn-search" onclick="checkForm()">
		<input type="button" value="전체보기" class="btn-all" onclick="location.href='MemberListCon.do'">
	
	</form>
	
	
		<h2 align="center"> 모든 회원 보기</h2>
		<table class="listtable">
			<tr height="40">
			
				<td align="center" width="50">아이디</td>
				<td align="center" width="200">이메일</td>
				<td align="center" width="150">전화</td>
				<td align="center" width="150">취미</td>
				<td align="center" width="150">직업</td>
				<td align="center" width="100">나이</td>
			</tr>
			
			<c:forEach items="${mList}" var="mem">

			<tr height="40">				
				<td align="center" width="50">${mem.id }</td>
				<td align="center" width="200">${mem.email }</td>
				<td align="center" width="150">${mem.tel }</td>
				<td align="center" width="150">${mem.hobby }</td>
				<td align="center" width="150">${mem.job }</td>
				<td align="center" width="100">${mem.age }</td>
			</tr>
		
			</c:forEach>		
		</table>
	</div>

	<script>
		function checkForm() {
			let f = document.mForm;			
			if(f.keyword.value == "") {
				alert("검색어를 입력하세요.")
				f.keyword.focuse();
				return;				
			}
			
			f.submit();
			
		}
	</script>
	