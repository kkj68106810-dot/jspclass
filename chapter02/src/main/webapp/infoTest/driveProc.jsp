<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>    
    

	<%
    	request.setCharacterEncoding("utf-8");
	
		String drvDate = request.getParameter("drvDate");
		String carNo = request.getParameter("carNo");
		String drvStart = request.getParameter("drvStart");
		String drvEnd = request.getParameter("drvEnd");
		String deptCode = request.getParameter("deptCode");
		String drvMoney = request.getParameter("drvMoney");

    
  		//DB 연동 시작---------------------------------------------------
  		Connection con = null;
  		PreparedStatement pstmt = null;
  		ResultSet rs = null;
  		// DB 접속 정보 설정
  		String driver = "com.mysql.cj.jdbc.Driver";
  		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
  		String user = "root";
  		String password = "1q2w3e4r";
  		
		String msg = "";  		 
  		// DB는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 오류를 찾기 어렵다.
  		
  		try {
  			Class.forName(driver);
  			
			con = DriverManager.getConnection(url, user, password);
		
			int drvStartNum = Integer.parseInt(drvStart);
			int drvEndNum = Integer.parseInt(drvEnd);
			int drvMoneyNum = Integer.parseInt(drvMoney);
			
			
			String sql = "INSERT INTO tbl_drive VALUE (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, drvDate);
			pstmt.setString(2, carNo);			
			pstmt.setInt(3, drvStartNum);
			pstmt.setInt(4, drvEndNum);			
			pstmt.setString(5, deptCode);			
			pstmt.setInt(6, drvMoneyNum);
			
			int resultCount = pstmt.executeUpdate();
			
			if(resultCount == 0 ){
				msg = "저장에 실패하였습니다.";
			}
  			
  		} catch(Exception e) {
  			e.printStackTrace();
  		} finally {
  			if(con != null) {
  				try {
  					con.close();
  				}catch (Exception e) {
  					e.printStackTrace();
  				}
  			}
  			if(rs != null) {
  				try {
  					rs.close();
  				}catch (Exception e) {
  					e.printStackTrace();
  				}
  			}

  			if(pstmt != null) {
  				try {
  					pstmt.close();
  				}catch (Exception e) {
  					e.printStackTrace();
  				}
  			}

  		}
	
			
		String deptName = "";
		
		DecimalFormat df1 = new DecimalFormat("#,##0");
		

		
		if(drvDate == null || drvDate.isEmpty()) {
			msg= "주행일자가입력되지않았습니다!";
		} else if (carNo == null || carNo.isEmpty()) {
			msg= "차량번호가입력되지않았습니다!";
		} else if (drvStart == null || drvStart.isEmpty()) {
			msg= "출발Km가입력되지않았습니다!";
		} else if (drvEnd == null || drvEnd.isEmpty()) {
			msg= "도착km가입력되지않았습니다!";
		} else if (deptCode == null || deptCode.isEmpty()) {
			msg= "부서코드가선택되지않았습니다!";
		} else if (drvMoney == null || drvMoney.isEmpty()) {
			msg= "주유금액이입력되지않았습니다!";
		}
		
		
		if (deptCode.equals("10")) {
			deptName = "영업부";
		} else if (deptCode.equals("20")){
			deptName = "총무부";	
		} else if (deptCode.equals("30")) {
			deptName = "구매부";	
		} else {
			deptName = "개발부";	
		}
		
		if(!(msg == "")) {%>
			<script type="text/javascript">
				alert(" <%=msg%> ")
				history.go(-1);
			</script>		
		<%} else { %>
			<script type="text/javascript">
				alert(" 저장에 성공하였습니다. ")
				history.go(-1);
			</script>
		
	<%}%>