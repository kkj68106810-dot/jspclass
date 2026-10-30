<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style/boardform.css">

<div class="boardwrap">
    <h2>게시글 쓰기</h2>
    <form action="BoardWriteProcCon.do" method="post" name="formname">
        <table class="form-table">
            <tr>
                <th>작성자</th>
                <td><input type="text" name="writer" class="form-input"></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="subject" class="form-input b_subject full-width"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="email" name="email" class="form-input"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="password" class="form-input"></td>
            </tr>
            <tr>
                <th>글내용</th>
                <td><textarea name="content" class="form-textarea b_contents"></textarea></td>
            </tr>
        </table>
        
        <div class="btn-group">
            <input type="button" class="btn btn-primary" onclick="BoardWriteException();" value="글쓰기">
            <input type="reset" class="btn btn-secondary" value="다시작성">
            <input type="button" class="btn btn-list" onclick="location.href='BoardListCon.do'" value="목록보기">
        </div>
    </form>
</div>

<script>
    function BoardWriteException(){
        let formname = document.formname;
        let sub = document.getElementsByClassName("b_subject")[0];
        let cont = document.getElementsByClassName("b_contents")[0];
        
        // trim()을 추가하여 스페이스바만 입력한 경우도 방지
        if(!sub.value.trim()){
            alert("제목을 입력하세요");
            sub.focus();
            return;
        }
        if(!cont.value.trim()){
            alert("내용을 입력하세요");
            cont.focus();
            return;
        }
        formname.submit();
    }
</script>