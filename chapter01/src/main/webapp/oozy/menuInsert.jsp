<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <h3>메뉴등록</h3>
    <form action="main.jsp?page=menuInsertProc.jsp" method="post">
    <table>
    	<tr>
    		<td><label for="menuName">메뉴명</label></td>
    		<td>
    			<input type="text" name="menuName" id="menuName">
    		</td>
    		<td>
    			<p>예) 콜드브루 라떼</p>
    		</td>
    	</tr>
    	
    	<tr>
    		<td><label for="category">분류</label></td>
    		<td>
    			<select name="category" id="category">
    				<option>분류</option>
    				<option value="10">COFFEE</option>
    				<option value="20">COLD BREW</option>
    				<option value="30">BEVERAGE</option>
    				<option value="40">DESSERT</option>
    			</select>
    		</td>
    		<td>

    		</td>
    	</tr>
    	
    	<tr>
    		<td><label for="price">가격</label></td>
    		<td>
    			<input type="text" name="price" id="price">
    		</td>
    		<td>
    			
    		</td>
    	</tr>
    	
    	<tr>
    		<td><label for="salesStatus">판매상태</label></td>
    		<td>
    			<input type="radio" name="salesStatus" value="sales">판매중
    			<input type="radio" name="salesStatus" value="season-out">SEASON OUT
    		</td>
    		<td>
    			
    		</td>
    	</tr>
    	
    	<tr>
    		<td><label for="description">설명</label></td>
    		<td colspan="2">
    			<input type="text" name="description" id="description">
    		</td>
    		
    	</tr>    	   	
    	
    	<tr>
    		<td colspan="3">
    			<input type="submit" value="제출">
    		</td>
    	</tr>
    	
    </table>
    </form>