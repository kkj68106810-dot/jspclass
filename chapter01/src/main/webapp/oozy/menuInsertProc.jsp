<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	String menuName = request.getParameter("menuName");
    	String category = request.getParameter("category");
    	String price = request.getParameter("price");
    	String salesStatus = request.getParameter("salesStatus");
    	String description = request.getParameter("description");
    	
    	
    	String msg = "";
    	DecimalFormat df = new DecimalFormat("#,##0");
    	int priceInt = 0;
    	if(menuName == null || menuName.isEmpty()) {
    		msg="메뉴명이입력되지않았습니다!";
    	} else if(category == null || category.isEmpty()) {
    		msg="분류가선택되지않았습니다!";
    	} else if(price == null || price.isEmpty()) {
    		msg="가격이입력되지않았습니다!";
    	} else if(salesStatus == null || salesStatus.isEmpty()) {
    		msg="판매상태가선택되지않았습니다!";
    	} else if(description == null || menuName.isEmpty()) {
    		msg="설명이입력되지않았습니다!";
    	} else {
    		priceInt = Integer.parseInt(price);	
    	}
    	
    	if(!(msg == "")) {%>
    		<script type="text/javascript">
    			alert("<%=msg%>")
    			history.go(-1)
    		</script>
    	<% } else { %>
    	
    
    
    
    
    
        <h3>메뉴 등록 확인</h3>
    
    <table>
    	<tr>
    		<td><label for="menu-name">메뉴명</label></td>
    		<td>
    			<%= menuName %>			
    		</td>
    		
       	</tr>
    	
    	<tr>
    		<td><label for="category">분류</label></td>
    		<td>
    			<%= category %>
    		</td>

    	</tr>
    	
    	<tr>
    		<td><label for="price">가격</label></td>
    		<td>
    			<%= df.format(priceInt) %>원		
    		</td>
    	</tr>
    	
    	<tr>
    		<td>판매상태</td>
    		<td>
    			<%= salesStatus %>
    		</td>
    	</tr>
    	
    	<tr>
    		<td>설명</td>
    		<td>
    			<%= description %>
    		</td>
    		
    	</tr>    	   	
    	
    	    	
    </table>
    <% } %>