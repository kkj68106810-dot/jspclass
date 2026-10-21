<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td {
		border: black 1px solid;
	}
</style>

</head>
<body>
	


<h3>주행내역 등록</h3>
	<div class="container">
		<form action="driveProc.jsp" method="post">
		<table class="list">
			<tr>
				<td><label for="drvDate">주행일자</label></td>
				<td>
					<input type="text" name="drvDate" id="drvDate" placeholder="예)20230101">				
				</td>
				<td>
					2023년01월01일 예)20230101
				</td>
			</tr>
			
			<tr>
				<td><label for="carNo">차량번호</label></td>
				<td>
					<input type="text" name="carNo" id="carNo">				
				</td>
				<td>
					애)10가0001
				</td>
			</tr>
			
			<tr>
				<td><label for="drvStart">출발KM</label></td>
				<td>
					<input type="text" name="drvStart" id="drvStart">km				
				</td>
			</tr>
			
			<tr>
				<td><label for="drvEnd">도착KM</label></td>
				<td colspan="2">
					<input type="text" name="drvEnd" id="drvEnd">km				
				</td>
			</tr>
			
			<tr>
				<td><label for="deptCode">부서코드</label></td>
				<td colspan="2">
					<select name="deptCode" id="deptCode">
						<option>부서</option>
						<option value="10">영업부</option>
						<option value="20">총무부</option>
						<option value="30">구매부</option>
						<option value="40">개발부</option>					
					</select>				
				</td>
			</tr>
			
			<tr>
				<td><label for="drvMoney">주유금액</label></td>
				<td colspan="2">
					<input type="text" name="drvMoney" id="drvMoney"> 원				
				</td>
			</tr>
			
			<tr>
				
				<td colspan="2">
					<input type="submit" value="제출">				
				</td>
				<td >
					<input type="reset" value="새로고침">				
				</td>
			</tr>
		
		</table>
		</form>
	</div>
</body>

</html>