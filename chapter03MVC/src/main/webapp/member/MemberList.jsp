<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="listwrap">
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
</body>
</html>