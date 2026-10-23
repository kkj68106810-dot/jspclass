<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
<%@ page import="java.sql.*" %>    

<h3>(제조사별)주행통계</h3>

    <table class="list">
    
    
	
			<tr>
				<th>제조사</th>
				<th>차량수</th>
				<th>총운행거리</th>
				<th>총주유금액</th>
				
		
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
  		
  		int searchCount = 0;  		 
  		// DB는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 오류를 찾기 어렵다.
  		
  		try {     
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
			String sql = "select ca.CAR_COMPANY as car_company , count(distinct(ca.car_no)) as car_count , sum(dr.drv_end - dr.drv_start) as killo, sum(dr.drv_money) as total_money from tbl_car ca left join tbl_drive dr on dr.car_no = ca.car_no group by ca.CAR_COMPANY";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();						
			while(rs.next()) {  				
			 %>
						
					<tr height="50" border="1" align="center">				
						<td><%=rs.getString("car_company")%></td>
						<td><%=rs.getString("car_count")%></td>
						<td><%=rs.getString("killo")%></td>
						<td><%=rs.getString("total_money")%></td>											
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
  			if(pstmt != null) {
  				try {
  					pstmt.close();
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
  			
  			
  		}


	%>    
    
    
    
    
    </table>