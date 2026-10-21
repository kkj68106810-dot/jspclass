<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량주행관리 프로그램</title>
<link rel="stylesheet" href="css/main_info.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String pageName = request.getParameter("page");
		
		// 메뉴를 클릭하지 않으면 기본화면인 home.jsp
		String contentPage = "home.jsp";
		
		// 클릭한 메뉴의 page의 이름을 section에 보여준다.
		if("carList.jsp".equals(pageName)){
			contentPage = "carList.jsp";
		} else if ("driveForm.jsp".equals(pageName)){
			contentPage = "driveForm.jsp";
		} else if ("driveList.jsp".equals(pageName)){
			contentPage = "driveList.jsp";
		} else if ("deptStat.jsp".equals(pageName)){
			contentPage = "deptStat.jsp";
		} else if ("driveProc.jsp".equals(pageName)) {
			contentPage = "driveProc.jsp";
		}
		
	%>

	<div id="wrap">
		<!-- header.jsp include 하기 -->
		<%@ include file="header.jsp" %>
		<!-- nav.jsp include 하기 -->
		<%@ include file="nav.jsp" %>
		
		<!-- section 부문의 html -->
		<section>
			
			<jsp:include page="<%=contentPage %>"></jsp:include>
			
		</section>
		
		<!-- footer.jsp include 하기 -->
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>