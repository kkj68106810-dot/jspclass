<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>
<jsp:include page="header.jsp" />



<section>
<h2>회원 매출 조회</h2>

<table>
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>	
	
	<%
		request.setCharacterEncoding("utf-8");
		
		try {
			Class.forName(driver);
			DecimalFormat df = new DecimalFormat("#,##0");
			con = DriverManager.getConnection(url, user, password);
			String sql = "select me.custno as custno, me.custname as custname, me.grade as grade, sum(mo.price) as total from member_tbl_02 me join money_tbl_02 mo	on me.custno = mo.custno group by mo.custno	order by total desc;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String gradeName = "";
				if ("A".equals(rs.getString("grade"))) {
					gradeName = "VIP";		
				} else if ("B".equals(rs.getString("grade"))) {
					gradeName = "일반";
				} else {
					gradeName = "직원";
				}
				
			%>	
				<tr>
					<td><%=rs.getInt("custno")%></td>
					<td><%=rs.getString("custname")%></td>
					<td><%=gradeName%></td>
					<td>\<%=df.format(rs.getInt("total"))%></td>					
				</tr>
			<%	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) con.close();
				if(rs != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	
	
	%>

</table>

</section>

<script type="text/javascript">

</script>

<jsp:include page="footer.jsp" />