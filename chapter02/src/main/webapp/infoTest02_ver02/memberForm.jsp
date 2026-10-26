<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>
<jsp:include page="header.jsp" />
<section>

<h2 align="center">회원등록 조회/수정</h2>
<table>
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</tr>
	
	<%
		request.setCharacterEncoding("utf-8");
		String grade = "";
		String gradeName = "";
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
			String sql = "select * from member_tbl_02";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // 지금 현재 커서 값은 존재하는 앞 부분에 위치
			
			
			while(rs.next()) {
				grade = rs.getString("grade");
				if(grade.equals("A")) gradeName="VIP";
				else if (grade.equals("B")) gradeName="일반";
				else gradeName="직원";
			%>		
				<tr>
					<td><a href="modForm.jsp?custno=<%=rs.getInt("custno")%>"><%=rs.getInt("custno")%></a></td>
					<td><%=rs.getString("custname")%></td>
					<td><%=rs.getString("phone")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getString("joindate")%></td>
					<td><%= gradeName %></td>
					<td><%=rs.getString("city")%></td>
				</tr>		
			
			<%
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(con != null) con.close();
				if (pstmt != null) pstmt.close();
			}catch(Exception e) {e.printStackTrace();}
		}


	%>	
	
	
	
</table>

</section>
<jsp:include page="footer.jsp" />