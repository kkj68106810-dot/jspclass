<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%!
		String[] names = {"송중기", "전지현", "손흥민", "김연아", "유재석"};
		int[] basePays = {350, 420, 280, 450, 310};
		int[] years = {5, 8, 2, 10, 4};
		
		public int getBonus(int year) {
			int bonus;
			if(year >= 7){
				bonus = 100;
			} else if (year >= 4){
				bonus = 70;
			} else {
				bonus = 40;
			}
			
			return bonus;
		}
		
		public int getTotalPay(int basePay, int bonus) {
			int totalPay = basePay + bonus;			
			return totalPay;
		}
		
		public String getGrade(int totalPay) {
			String returnGrade = "";
			if(totalPay >= 500) {
				returnGrade = "S";
			} else if (totalPay >=400) {
				returnGrade = "A";
			} else if (totalPay >=300) {
				returnGrade = "B";
			} else if (totalPay <300) {
				returnGrade = "C";
			} 
			return returnGrade;
		}
		
	%>
	
	<h2>월급</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>기본급</th>
			<th>연차</th>
			<th>근속수당</th>
			<th>총급여</th>
			<th>등급</th>
			<th>성과그래프</th>
		</tr>
		
		<% for(int i = 0; i < names.length; i++) {
			int bonus = getBonus(years[i]);
			int totalPay = getTotalPay(basePays[i], bonus); 
			String grade = getGrade(totalPay);
		%>
		<tr style="background-color: <%= totalPay < 400 ? "#fff3cd" : ""  %> ">		
					
			<td>			
				<%=i+1%>							
			</td>
			<td>			
				<%=names[i]%>							
			</td>
			<td>			
				<%=basePays[i]%>							
			</td>
			<td>			
				<%=years[i]%>							
			</td>
			<td>			
				<%=bonus%>							
			</td>
			<td>			
				<%=totalPay%>							
			</td>
			<td>			
				<%=grade%>							
			</td>
			<td>			
				<div style="width : <%=totalPay > 300 ? (totalPay - 300) * 2 : 0 %>px ; height: 20px; background-color: blue">
				</div>						
			</td>
			
			
		</tr>			
		<% } %>
	</table>
	

</body>
</html>