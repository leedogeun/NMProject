<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function check(){ // 게시글 수정 시 비밀번호 확인
	var pw = $("#password").val();
	if(pw == "") {
		//$("#password").text("비밀번호를 입력하세요."); // span 부분에 에러메세지 내용이 나타난다.  
		alert("비밀번호를 입력해 주세요."); 
		return false;
	}

	var result = true;
	var data = { "password": $("#password").val(), "bno" : "${board.bno}" };
	
	$.ajax({
        url:"/board/pwCheck",
        type:'POST',
        data: data,
        async: false,
        success:function(data){
            if(data == 0){
            	 alert("비밀번호가 틀렸습니다. 다시 입력해 주세요")
            	result = false;
            }else {
            	result = true;
            }
        }
        /* error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        } */ 
	})
	return result;
}
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 수정하기</h2>
	<form method="post" action="updateBoard" onsubmit="return check();">
		<input type="hidden" name="bno" value="${board.bno}"/>
		<div class="form-group">
	    	<label for="btitle">제목</label>
	    	<input id="btitle" name="btitle" value="${board.btitle}" type="text" class="form-control" placeholder="제목을 입력하세요">
	    </div>
	  	<div class="form-group">
	    	<label for="bcontent">내용</label>
	    	<textarea id="bcontent" name="bcontent" class="form-control" rows="3" placeholder="내용을 입력하세요">${board.bcontent}</textarea>
	  	</div>
	  	<div class="form-group">
	    	<label for="password">비밀번호</label>
	    	<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력해야 수정할 수 있습니다."></input>
	  	</div>
	  	<div class="form-group">
	  		<input type="submit" class="btn btn-default" value="수정하기"/>
	  		<a href="boardDetail?bno=${board.bno}" class="btn btn-default" role="button">취소</a>
	  	</div>
	</form>		
</body>
</html>