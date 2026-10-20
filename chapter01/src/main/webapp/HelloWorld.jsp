<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	HelloWorld ~ 반갑다. JSP
	<%
		// 스크립트안의 코드는 자바이므로 자바 주석처리 됨
		//Date day = new Date();
		//int i = 10;
		//System.out.println(i);
		int sum = 10/0;
	%>
</body>
</html>