<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>
<jsp:include page="header.jsp" />
<section>

<h2 align="center">회원등록 수정</h2>
<table class="form">
	<form action="modProc.jsp" method="post" name="mForm">
	<%
		request.setCharacterEncoding("utf-8");
		String custno = request.getParameter("custno");
		
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
			String sql = "select * from member_tbl_02 where custno = ?";
			
			pstmt = con.prepareStatement(sql);
			int custnoNum = Integer.parseInt(custno);
			
			pstmt.setInt(1, custnoNum);
			
			rs = pstmt.executeQuery(); 
			
			
			if(rs.next()) {
			%>
			
					
			<tr>
				<th>회원번호(자동생성)</th>
				<td><input type="text" name="custno" value="<%=custno%>" readonly="readonly"></td>			
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" value="<%=rs.getString("custname")%>"></td>			
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>			
			</tr>			
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>			
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" value="<%=rs.getString("joindate")%>" ></td>			
			</tr>	

			<tr>
				<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td>
						<select name="grade">
							<option value="">선택</option>
							<option value="A" <%="A".equals(rs.getString("grade")) ? "SELECTED" : "" %>>[A]VIP</option>
							<option value="B" <%="B".equals(rs.getString("grade")) ? "SELECTED" : "" %>>[B]일반</option>
							<option value="C" <%="C".equals(rs.getString("grade")) ? "SELECTED" : "" %>>[C]직원</option>				
						</select>
				
				</td>						
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" value="<%=rs.getString("city")%>"></td>			
			</tr>
			<tr>
				
				<td colspan="2" class="btn-area">
					<input type="button" value="수 정" onclick="checkForm()">
					<input type="button" value="조 회" onclick="location.href='memberForm.jsp'">
				</td>			
			</tr>
			
		</table>	

			
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
		</form>			
</table>
</section>

<script type="text/javascript">
	function checkForm() {
		let f = document.mForm;
		if(f.custname.value =="") {
			alert("회원성명 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.custname.focus();
			return;
		} 
		if(f.phone.value =="") {
			alert("전화 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.phone.focus();
			return;
		}
		if(f.address.value =="") {
			alert("주소 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.address.focus();
			return;
		}
		if(f.joindate.value =="") {
			alert("가입날짜 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.joindate.focus();
			return;
		}
		if(f.city.value =="") {
			alert("도시코드 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.city.focus();
			return;
		}
		if(f.grade.value =="") {
			alert("등급 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.grade.focus();
			return;
		}
		
		f.submit();
	}

</script>

<jsp:include page="footer.jsp" />