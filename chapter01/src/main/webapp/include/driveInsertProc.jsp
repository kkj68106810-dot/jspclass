<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

	<%
		request.setCharacterEncoding("utf-8");
	
		String drvDate = request.getParameter("drvDate");
		String carNo = request.getParameter("carNo");
		String drvStart = request.getParameter("drvStart");
		String drvEnd = request.getParameter("drvEnd");
		String deptCode = request.getParameter("deptCode");
		String drvMoney = request.getParameter("drvMoney");
		
		String deptName = "";
		
		DecimalFormat df1 = new DecimalFormat("#,##0");
		
		String msg = "";
		
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
							  
		
		int drvMoneyNum = Integer.parseInt(drvMoney);
		
		
		if(!(msg == "")) {%>
			<script type="text/javascript">
				alert(" <%=msg%> ")
				history.go(-1);
			</script>		
		<%} else { %>

	<div class="container">
		
		<table>
			<tr>
				<td><label for="drvDate">주행일자</label></td>
				<td>
					<%= drvDate %>일				
				</td>
			</tr>
			
			<tr>
				<td><label for="carNo">차량번호</label></td>
				<td>
					<%= carNo %>번				
				</td>
			</tr>
			
			<tr>
				<td><label for="drvStart">출발KM</label></td>
				<td>
					<%= drvStart %>km				
				</td>
			</tr>
			
			<tr>
				<td><label for="drvEnd">도착KM</label></td>
				<td>
					<%= drvEnd %> km				
				</td>
			</tr>
			
			<tr>
				<td><label for="deptCode">부서코드</label></td>
				<td>
					<%= 
						deptName
					%>				
				</td>
			</tr>
			
			<tr>
				<td><label for="drvMoney">주유금액</label></td>
				<td>
					<%= df1.format(drvMoneyNum) %> 원				
				</td>
			</tr>	
			
		
		</table>
		
	</div>
	<%}%>