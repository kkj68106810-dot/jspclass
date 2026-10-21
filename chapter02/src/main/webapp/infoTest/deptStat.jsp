<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%@ page import="java.sql.*" %>
    
    <h3>부서별 통계 조회</h2>
    
    <table class="list">
    	<tr>
    		<th>부서코드</th>
    		<th>부서명</th>
    		<th>총운행거리</th>
    		<th>총주유금액</th>    		
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
  				
  				String sql = "select tdep.dept_code as dept_code, tdep.dept_name as dept_name, sum(tdrv.DRV_END-tdrv.DRV_START) as totalk ,sum(tdrv.DRV_MONEY) as totalm from tbl_dept tdep join tbl_drive tdrv on tdep.dept_code = tdrv.dept_code group by dept_code";
  			
  				
  				pstmt = con.prepareStatement(sql);
  				
  				rs = pstmt.executeQuery();
  				
  				while(rs.next()) {
  			%>			
  				<tr>
  					<td><%=rs.getString("dept_code")%></td>
  					<td><%=rs.getString("dept_name")%></td>
  					<td><%=rs.getString("totalk")%></td>
  					<td><%=rs.getString("totalm")%></td>
  				</tr>	
  					
  			<%	}
  				
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

    