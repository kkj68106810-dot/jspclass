<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.UTIL" %>


<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf-8");
	int nextNo = 0;
	try {
		
		con = UTIL.getConnection();
		
		String sql = "select ifnull(max(custno), 100000)+1 as cust from member_tbl_02";
		pstmt = con.prepareStatement(sql);
		rs= pstmt.executeQuery();
		
		if(rs.next()) {
			nextNo= rs.getInt("cust");	
		}
		
		
	} catch(Exception e) {
		e.printStackTrace();
	}finally {		
		try {
			if(rs != null) rs.close();
			if(con != null) rs.close();
			if(pstmt != null) rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}	

%>



<jsp:include page="header.jsp" />

<section>
	<h2>홈쇼핑 회원등록</h2>
	<form action="joinProc.jsp" method="post" name="jForm">
		<table class="form">
			<tr>
				<th>회원번호(자동생성)</th>
				<td><input type="text" name="custno" value="<%=nextNo%>" readonly="readonly"></td>			
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" value=""></td>			
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value=""></td>			
			</tr>			
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" value=""></td>			
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" value="" >예)20151202</td>			
			</tr>	

			<tr>
				<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td>
						<select name="grade">
							<option value="">선택</option>
							<option value="A">[A]VIP</option>
							<option value="B">[B]일반</option>
							<option value="C">[C]직원</option>				
						</select>
				
				</td>						
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city"></td>			
			</tr>
			<tr>
				
				<td colspan="2" class="btn-area">
					<input type="button" value="등 록" onclick="checkForm()">
					<input type="button" value="조 회" onclick="location.href='Member.jsp'">
				</td>			
			</tr>
			
		</table>	
	</form>
</section>

<script type="text/javascript">
	function checkForm() {
		let f = document.jForm;
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