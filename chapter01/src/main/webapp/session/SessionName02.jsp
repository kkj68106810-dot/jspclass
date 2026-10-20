<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 네임페이지</h2>
	<%
		request.setCharacterEncoding("utf-8");
		
		String seName03 = session.getAttribute("seName").toString();
	%>
	
	<p><%= seName03 %>님 반갑습니다.</p>
	
</body>
</html>