<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
	<h3>차량별주행조회</h3>


		
	<div class="drive-wrap">
	
	<table class="list">
	
		<tr>
			<th>주행일자</th>
			<th>출발km</th>
			<th>도착km</th>
			<th>운행거리</th>
			<th>부서명</th>
			<th>주유금액</th>
		
		</tr>
	
	<%
    	request.setCharacterEncoding("utf-8");
	
		
		String carNo = request.getParameter("search-car");		

    
  		//DB 연동 시작---------------------------------------------------
  		Connection con = null;
  		PreparedStatement pstmt = null;
  		ResultSet rs = null;
  		// DB 접속 정보 설정
  		String driver = "com.mysql.cj.jdbc.Driver";
  		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
  		String user = "root";
  		String password = "1q2w3e4r";
  		
  		try {
  			Class.forName(driver);
  			
  			con = DriverManager.getConnection(url, user, password);
  			String sql = "select dr.car_no as car_no, ca.car_model as car_model, dr.drv_date as drv_date, dr.DRV_START as drv_start	, dr.DRV_END as drv_end	, (dr.DRV_END - dr.drv_start) as killo	, de.DEPT_NAME as dept_name	, dr.DRV_MONEY as drv_money	from tbl_drive dr join tbl_dept de on de.dept_code = dr.dept_code join tbl_car ca on ca.car_no = dr.car_no	where dr.car_no = ?";
  			pstmt = con.prepareStatement(sql);
  			
  			pstmt.setString(1, carNo);
  			
  			rs = pstmt.executeQuery();
  			
  			
  			while(rs.next()) {
				
			%>	
				<tr height="50" border="1" align="center">
				
					<td><%=rs.getString("drv_date")%></td>
					<td><%=rs.getString("drv_start")%></td>
					<td><%=rs.getString("drv_end")%></td>
					<td><%=rs.getString("killo")%></td>
					<td><%=rs.getString("dept_name")%></td>
					<td><%=rs.getString("drv_money")%></td>					
				</tr>
		<%	}
  			
  			
  			
  		} catch(Exception e) {
  			e.printStackTrace();
  		} finally{
  			if(con != null) {
  				try {
  					con.close();
  				}catch(Exception e) {
  					e.printStackTrace();
  				}
  			}
  			if(pstmt != null) {
  				try {
  					pstmt.close();
  				}catch(Exception e) {
  					e.printStackTrace();
  				}
  			}
  			if(rs != null) {
  				try {
  					rs.close();
  				}catch(Exception e) {
  					e.printStackTrace();
  				}
  			}
  		}
  		
  		
  		
  		
  		%>
  		
  		</table>
  		</div>
  		
  		