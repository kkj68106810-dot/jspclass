<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name = "Kim";
		// session은 내장객체로 서버에서 정보를 유지한다.
		session.setAttribute("seName", name);
		session.setMaxInactiveInterval(10);		
	%>
	<a href="SessionName.jsp">세션네임 페이지로 이동</a>	
	
</body>
</html>