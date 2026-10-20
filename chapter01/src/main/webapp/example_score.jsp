<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th, td {
		padding: 6px 10px;
	}
	
	td.score {
		width: 300px;
		text-align: left;
	}
	td.score div {
		height: 20px;               
		background-color: #4CAF50;  
	}
	
</style>

</head>
<body>
	<%!
		String[] names= {"김철수", "이영희", "박민수", "최지우", "정다은"};
		int[] scores = {92, 78, 55, 85, 67};
		
		private String getGrade(int score) {			
			String resultGrade = "F";			
			for(int i = 0; i < scores.length; i++) {
				if(score >= 90) {
					resultGrade = "A";
				} else if (score >= 80) {
					resultGrade = "B";
				} else if (score >= 70) {
					resultGrade = "C";
				} else if (score >= 60) {
					resultGrade = "D";
				}
			}			
			return resultGrade;
		}
	%>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>점수</th>
			<th>등급</th>
			<th>그래프</th>
		</tr>
		<% for(int j = 0 ; j < names.length; j++) { %>
		<tr style="background-color:<%= scores[j]<60 ? "#ffcccc":"#ffffff" %>">
		
			<td><%=j+1%></td>
			<td><%=names[j]%></td>
			<td><%=scores[j]%></td>
			<td><%=getGrade(scores[j])%></td>
			<td class="score" >
				<div style="width: <%= scores[j] * 3 %>px;" ></div>
			</td>	
						
		</tr>
		<% } %>
		
	</table>
</body>
</html>