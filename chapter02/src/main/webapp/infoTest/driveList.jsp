<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>
    
    <h3>주행조회</h3>
    <table class="list">
    	<tr>
    		<th>주행일자</th>
    		<th>차량번호</th>
    		<th>모델</th>
    		<th>출발km</th>
    		<th>도착km</th>
    		<th>부서명</th>
    		<th>주유금액</th>
    	</tr>
		    
    
    <%
    	request.setCharacterEncoding("utf-8");
    
    
    	DecimalFormat df = new DecimalFormat("#,##0");
    
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
    		
    		String sql = "select tdr.DRV_DATE as drv_date , tdc.CAR_NO as car_no  , tdc.CAR_MODEL as car_model  , tdr.DRV_START as drv_start  , tdr.DRV_END as drv_end  , tde.DEPT_NAME as dept_name  , tdr.DRV_MONEY as drv_money from tbl_drive	tdr	join tbl_dept	tde	on tdr.DEPT_CODE = tde.DEPT_CODE join tbl_car tdc on tdr.car_no = tdc.car_no";
    		
    		pstmt = con.prepareStatement(sql);
    		
    		rs = pstmt.executeQuery();
    		
    		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년MM월dd일");	
    		while(rs.next()) {
    			String drvStartStr = df.format(rs.getInt("drv_start"));
    			String drvEndStr = df.format(rs.getInt("drv_end"));
    			String drvMoneyStr = df.format(rs.getInt("drv_money"));
    			String drvDateStr = simpleDateFormat.format(rs.getString("drv_date"));	
    		%>	
    			<tr>
    				<td><%= drvDateStr %></td>
    				<td><%= rs.getString("car_no") %></td>
    				<td><%= rs.getString("car_model") %></td>
    				<td><%= drvStartStr %></td>
    				<td><%= drvEndStr %></td>
    				<td><%= rs.getString("dept_name") %></td>
    				<td>\<%= drvMoneyStr %></td>    				
    			</tr>			
    		<%
    		}
    		
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			if(con != null) {
  				try {
  					con.close();
  				} catch(Exception e) {
  					e.printStackTrace();		
  				}
  			}
  			if(rs != null) {
  				try {
  					rs.close();
  				} catch(Exception e) {
  					e.printStackTrace();		
  				}
  			}
  			if(pstmt != null) {
  				try {
  					pstmt.close();
  				} catch(Exception e) {
  					e.printStackTrace();		
  				}
  			}
  		}
    
    %>   
    
    	
    </table>
