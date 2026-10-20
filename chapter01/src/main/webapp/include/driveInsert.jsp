<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
		<form action="main.jsp?page=driveInsertProc.jsp" method="post">
		<table>
			<tr>
				<td><label for="drvDate">주행일자</label></td>
				<td>
					<input type="text" name="drvDate" id="drvDate" placeholder="예)20230101">				
				</td>
			</tr>
			
			<tr>
				<td><label for="carNo">차량번호</label></td>
				<td>
					<input type="text" name="carNo" id="carNo" placeholder="예)10가0001 ">				
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
				<td>
					<input type="text" name="drvEnd" id="drvEnd">km				
				</td>
			</tr>
			
			<tr>
				<td><label for="deptCode">부서코드</label></td>
				<td>
					<select name="deptCode" id="deptCode">
						<option value="10">영업부</option>
						<option value="20">총무부</option>
						<option value="30">구매부</option>
						<option value="40">개발부</option>					
					</select>				
				</td>
			</tr>
			
			<tr>
				<td><label for="drvMoney">주유금액</label></td>
				<td>
					<input type="text" name="drvMoney" id="drvMoney"> 원				
				</td>
			</tr>
			
			<tr>
				
				<td >
					<input type="submit" value="제출">				
				</td>
				<td >
					<input type="reset" value="새로고침">				
				</td>
			</tr>
		
		</table>
		</form>
	</div>