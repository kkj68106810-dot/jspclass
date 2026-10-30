<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/BoardList.css">

<div class="boardwrap">
	<h2>전체 게시글 보기</h2>
	<p>로그인 후 글을 작성하세요.</p>
	<table width="700" border="1">
		<tr height="40">
			<td colspan="5" align="right">
				<c:if test="${not empty sessionScope.id }">
					<button onclick="location.href='index.jsp?section=board/BoardWriteForm.jsp'">
						글 쓰기				
					</button>			
				</c:if>		
			</td>			
		</tr>
		<tr>
			<td width="50" align="center">번호</td>
			<td width="50" align="center">제목</td>
			<td width="50" align="center">작성자</td>
			<td width="50" align="center">작성일</td>
			<td width="50" align="center">조회수</td>			
		</tr>
		<c:set var="number" value="${number}" />
		<c:forEach items="${blist}" var="blist">
		
			<tr height="40">
				<td width="50" align="center">${number }</td>
				<td width="320" align="left">
					<%-- ${blist.re_step} --%>
					<a href="BoardInfoControl.do?num=${blist.num}">${blist.subject }</a>
				</td>
				<td width="50" align="center">
					${blist.writer }
				</td>
				<td width="50" align="center">
					${blist.reg_date }
				</td>
				<td width="50" align="center">
					${blist.readcount }
				</td>
			</tr>
			<c:set var="number" value="${number-1}" />
		</c:forEach>			
	</table>
	<!-- 페이징할 부분 -->
	<div class="paging">
	<!-- [1][2][3]에서 [1][2]인 경우 3페이지는 만들어지면 안됨 -->
	<!-- [이전]이라는 링크를 만들건지 파악 -->
		<c:if test="${startPage > pageBlock}">
			<a href="BoardListCon.do?pageNum=${startPage -pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="BoardListCon.do?pageNum=${i}">[${i }]</a>
		</c:forEach>
		
		<c:if test="${endPage < pageCount}">
			<a href="BoardListCon.do?pageNum=${startPage + pageBlock}">[다음]</a>
		</c:if>
	</div>
</div>

<script>

</script>
