<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	boolean msgChk = false;  // 회원등록이 될때 메시지 체크 변수
	String custno = request.getParameter("custno");
	int custnoNum = Integer.parseInt(custno);
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno = ?";
		pstmt = con.prepareStatement(sql);
					
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("joindate"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		pstmt.setInt(7, custnoNum);		
		msgChk = pstmt.executeUpdate() > 0;		
	} catch(Exception e) {
		e.printStackTrace();
	}finally {		
		try {
			if(rs != null) rs.close();
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
%>

<script type="text/javascript">
	<% if(msgChk) { %>
	alert("회원등록이 완료됨")
	location.href="memberForm.jsp"
	<%} else {%>
		alert("등록실패")
		history.go(-1);
	<%}%>
</script>