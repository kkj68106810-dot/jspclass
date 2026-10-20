<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script></script>
</head>
<body>
	<%!
		int[] winNums = {3, 12, 19, 27, 33, 41};
		private boolean isWinning(int num) {
			boolean isResult = false;
			for (int nums : winNums) {
				if(num == nums) {
					isResult = true;
				}
			}
			return isResult;
		}
		
	%>
	<h2>번호판</h2>
	<table border="1">
		
		<% 
			int addNum = 1;
			for(int i = 1; i <= 5 ; i++) { 
		%>
		<tr>
		<% for(int j = 1; j <= 9 ; j++){ %>
					
			<td style=<%= isWinning(addNum) == true ? "background-color:gold;font-weight:bold" : "" %>   >				
				<%= addNum ++ %>							
			</td>
			
		<% } %>	
		</tr>
		<% } %>	
		
	</table>
	<p>당첨 번호 :
	<% for(int i = 0; i < winNums.length; i++) { 
		if( i == winNums.length-1) {
	%>
		<%= winNums[i] %> 	
	<% } else { %>
		<%= winNums[i] %> ,
	<% } %>
	<% } %>
	</p>
		
</body>
</html>