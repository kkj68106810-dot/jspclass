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
		<form name="driveFrm" action="driveProc2.jsp" method="post">
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
						<option value="">부서</option>
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
				
				<td colspan="3">
					<input type="button" value="제출" onclick="chkform()">				

					<input type="button" value="새로고침" onclick="resetform()">				
				</td>
			</tr>
		
		</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function chkform() {
			let f = document.driveFrm;
			if(f.drvDate.value =="") {
				alert("주행날짜 안됨");
				f.drvDate.focus();
				return;
			}
			
			if(f.carNo.value =="") {
				alert("차량번호 안됨");
				f.carNo.focus();
				return;
			}
			
			if(f.drvStart.value =="") {
				alert("출발km 미입력");
				f.drvStart.focus();
				return;
			}
			
			if(f.drvEnd.value =="") {
				alert("도착km 미입력");
				f.drvEnd.focus();
				return;
			}
			
			if(f.deptCode.value =="") {
				alert("부서 선택안됨");
				f.deptCode.focus();
				return;
			}
			
			if(f.drvMoney.value =="") {
				alert("주유비 입력안됨");
				f.drvMoney.focus();
				return;
			}
			
			f.submit();
			
		}		

		
		
		function resetform() {
			let f = document.driveFrm;
			alert("정보를 지우고 다시 입력");
			f.reset();
			f.drvDate.focus();
		}
	
	</script>
</body>

</html>