<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jstl Test</title>
</head>
<body>
<c:if test="${4 >3 }">
	<p>ok sk</p>
</c:if>

<c:set var="name">홍길동</c:set>
<c:set var="age" value="25" />
나의 이름은 ${name} 
<c:out value="${age}" />

<c:remove var="name" />
나의 이름은 <c:out value="${name}" /> <br>

<c:forEach var="i" begin="1" end="10" step="1">
	<c:set var="sum" value="${sum+i}" />
	
	

</c:forEach>
<p>1부터 10까지 합 : ${sum}  </p>

<h2>문자열 분리</h2>
<c:forTokens var="car" items="소나타-그랜저-아우디" delims="-">
${car }

</c:forTokens>
<br />
<c:set var="color" value="red,green,black,yellow" />
<c:forEach var="arr" items="${color }"> 
	<c:choose>
		<c:when test="${arr=='red' }">빨강</c:when>
		<c:when test="${arr=='green' }">초록</c:when>
		<c:when test="${arr=='black' }">검정</c:when>
		<c:when test="${arr=='yellow' }">노랑</c:when>
		<c:otherwise>파랑</c:otherwise>
	</c:choose>
</c:forEach>


 
</body>
</html>