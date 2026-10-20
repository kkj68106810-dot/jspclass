<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 처리 페이지</h2>
	<%
		request.setCharacterEncoding("utf-8");
	
		String dbid="aaaa";
		String dbpw="1234";
		
		// request
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(dbid.equals(id) && dbpw.equals(pass)) {
			response.sendRedirect("ResponseMain.jsp?id="+id);
		} else {%>
		<script type="text/javascript">
			alert("아이디와 비밀번호를 입력하세요.")
		</script>
		<% } %>
		
	
	
	<!-- 화면  -->
	<p>아이디: <%=id %></p>
	<p>패스워드: <%=pass %></p>
</body>
</html>