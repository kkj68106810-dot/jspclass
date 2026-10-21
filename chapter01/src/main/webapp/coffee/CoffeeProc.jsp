<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String coffee = request.getParameter("coffee");
		String count = request.getParameter("count");
		String pay = request.getParameter("pay");
		
		int countNum = 0;
		int payNum = 0;
				
		int price = 0;
		String msg = "";
		
		if(coffee == null){
			price = 0;		
		}else if (coffee.equals("americano")) {
			price = 3000;
		} else if (coffee.equals("cafferatte")) {
			price = 3300;
		} else if (coffee.equals("esspresso")) {
			price = 2500;
		} else if (coffee.equals("ulgray")) {
			price = 3500;
		} 
		
		if(coffee == null || coffee.isEmpty()) {
			msg="커피를 선택해 주세요";
		} else if (count == null || count.isEmpty()) {
			msg="수량을 선택해 주세요";
		} else if (pay == null || pay.isEmpty()) {
			msg="입금액을 입력해 주세요";
		} else {
			countNum = Integer.parseInt(count);
			payNum = Integer.parseInt(pay);
		}

		if(payNum - price*countNum <0) {
			msg = "입금액이 상품가격보다 적습니다.";
		}
		 DecimalFormat df1 = new DecimalFormat("#,##0");
		 
		if(!(msg == "")) { %>
			<script type="text/javascript">
				alert("<%= msg %>");
				history.go(-1);
			</script>			
	<%	} else { %>
			
		
	

	<div class="coffee-container">
		<h2>주문계산결과</h2>		
		<ul>
			<li>
				커피종류 : <%=coffee %>
				
			</li>
			<li>
				1개 가격 : <%=df1.format(price)원%>
			</li>
			<li>
				수량 :<%=countNum%> 
			</li>
			<li>
				총 금액 : <%=df1.format(price*countNum)원 %> 
			</li>
			<li>
				입금액 : <%= df1.format(payNum)원 %> 				
			</li>
			<li>
				거스름돈 : <%= df1.format(payNum - price*countNum)원 %> 				
			</li>
		</ul>		
	</div>
	
	<% } %>
</body>
</html>