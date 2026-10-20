<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border: 1px solid black;
	}
</style>
</head>
<body>
<!-- 구구단 2단부터 9단까지 -->
	<h1>구구단</h1>
	<table border="1">
		<tr>
			<%
				for(int i = 2; i <=9; i++) { %>
					<th><%= i %>단</th>					
			<%		
				}
			%>
		</tr>
		<tr>
			<%	for(int i = 1; i <=9; i++){ %> 
				<tr>	
			<%	for(int j =2; j <=9; j++){ %>
			<td><%=j%>*<%=i%> = <%=i*j%></td>
			<% } %>		
		<% } %>		
				</tr>
	</table>



</body>
</html>