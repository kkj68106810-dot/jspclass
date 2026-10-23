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
<input type="hidden" name="page" value="carDrive" >
	<%
		request.setCharacterEncoding("utf-8");
	
		String pageName = request.getParameter("page");
		
		// 메뉴를 클릭하지 않으면 기본화면인 home.jsp
		String contentPage = "";
		
		
		System.out.println("index page : " + pageName);
		
		// 클릭한 메뉴의 page의 이름을 section에 보여준다.
		if("carList.jsp".equals(pageName)){
			contentPage = "carList.jsp";
		} else if ("driveForm.jsp".equals(pageName)){
			contentPage = "driveForm.jsp";
		} else if ("driveList.jsp".equals(pageName)){
			contentPage = "driveList.jsp";
		} else if ("deptStat.jsp".equals(pageName)){
			contentPage = "deptStat.jsp";
		} else if ("driveProc2.jsp".equals(pageName)) {
			contentPage = "driveProc.jsp";
		} else if ("carDrive.jsp".equals(pageName)) {
			contentPage = "carDrive.jsp";
		} else if ("companyStat.jsp".equals(pageName)) {
			contentPage = "companyStat.jsp";
		}else if ("carDriveProc.jsp".equals(pageName)) {
			contentPage = "carDriveProc.jsp";
		}
		
	%>

	<div id="wrap">
		<!-- header.jsp include 하기 -->
		<%@ include file="header.jsp" %>
		
				
		<!-- section 부문의 html -->
		<section>
								
			<% if (contentPage == "" ) {%>
				<h3>과정평가형 자격 CBQ</h3>
				<p>국가직무능력표준(NCS:National Competency Standars)으로 설계된 교육훈련과정을 충실히 이수한 후,
				   내부 외부 평가를 거쳐 일정 합격 기준을 충족하는 교육훈련생에게 국가기술자격을 부여하는 제도</p>
				<p class="bold">산업현장 중심의 교육평가로 더 커지는 능력!</p>
				<p class="bold">알고 있는 것에 할 수 있는 것을 더하는</p>
				<p class="bold">과정평가형 자격은</p>
				<p class="bold">현장 중심형 인재육성을 지원합니다.</p>   				
										
			<%} else { %>
			<jsp:include page="<%=contentPage %>"></jsp:include>
			<%} %>
		</section>
		
		<!-- footer.jsp include 하기 -->
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>