<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- I-link ti CSS file -->
<link rel="stylesheet" href="style/boardInfo.css">

<div class="rewrap">
    <h2>게시글 보기</h2>
    <table class="board-table">
        <tr>
            <th>글번호</th>
            <td>${bdto.num }</td>
            <th>조회수</th>
            <td>${bdto.readcount }</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${bdto.writer }</td>
            <th>작성일</th>
            <td>${bdto.reg_date }</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td colspan="3">${bdto.email }</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${bdto.subject }</td>
        </tr>
        <tr>
            <th>글내용</th>
            <td colspan="3" class="content-cell">${bdto.content }</td>
        </tr>
    </table>
    
    <!-- Dagiti butones -->
    <div class="btn-group">
        <input type="button" class="btn btn-reply" value="답글쓰기" onclick="location.href='BoardReWriterCon.do?num=${bdto.num}&ref=${bdto.ref}&re_step=${bdto.re_step}'">
        <input type="button" class="btn btn-edit" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bdto.num}'">
        <input type="button" class="btn btn-delete" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bdto.num}'">
        <input type="button" class="btn btn-list" value="목록보기" onclick="location.href='BoardListCon.do'">
    </div>
</div>