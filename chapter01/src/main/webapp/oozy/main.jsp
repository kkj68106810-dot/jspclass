<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OZZY COFFEE</title>
<link rel="stylesheet" href="css/coffee.css">
</head>
<body>

	<%
		String pageName = request.getParameter("page");
	
		String nowPage = "home.jsp";
		if("menuList.jsp".equals(pageName)) {
			nowPage = "menuList.jsp";
		} else if ("menuInsert.jsp".equals(pageName)) {
			nowPage = "menuInsert.jsp";
		} else if ("menuInsertProc.jsp".equals(pageName)) {
			nowPage = "menuInsertProc.jsp";
		}
		
	%>

	<header>
		<%@include file="header.jsp" %>
		<%@include file="nav.jsp" %>
	</header>
	<section>
		<jsp:include page="<%=nowPage%>"></jsp:include>
	</section>
	
	<footer>
		<%@include file="footer.jsp" %>
	</footer>
</body>
</html>