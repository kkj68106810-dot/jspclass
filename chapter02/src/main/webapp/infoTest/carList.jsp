<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
    
<h3>차량조회</h3>


<table class="list">
	<tr>
		<th>차량번호</th>
		<th>모델</th>
		<th>제조사</th>
		<th>구매일</th>
	</tr>

<%
	request.setCharacterEncoding("utf-8");
		
	//DB 연동 시작---------------------------------------------------
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root";
	String password = "1q2w3e4r";	
	// DB는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 오류를 찾기 어렵다.
		
	try {
		Class.forName(driver);
		
		con = DriverManager.getConnection(url, user, password);
		String sql = "select * from tbl_car";
			
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("car_no")  %></td>
		<td><%=rs.getString("car_model") %></td>
		<td><%=rs.getString("car_company") %></td>
		<td><%=rs.getString("car_date") %></td>
	</tr>
			
	<% }	
		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}
	}

%>

</table>


	
	
	
	
	
	
	
	
	
	
	