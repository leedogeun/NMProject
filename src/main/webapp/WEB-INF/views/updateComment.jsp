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
function checkUpdate(){ // 댓글 수정 시 비밀번호 확인
	var pw = $("#password").val();
	if(pw == "") {
		//$("#password").text("비밀번호를 입력하세요."); // span 부분에 에러메세지 내용이 나타난다.  
		alert("비밀번호를 입력해 주세요."); 
		return false;
	}

	var resultU = true;
	var data = { "password": $("#password").val(), "bno" : "${board.bno}", "cno" : "${comment.cno}" };
	
	$.ajax({
        url:"/board/pwCheckComment",
        type:'POST',
        data: data,
        async: false,
        success:function(data){
            if(data == 0){
            	 alert("비밀번호가 틀렸습니다. 다시 입력해 주세요")
            	resultU = false;
            }else {
            	resultU = true;
            }
        }
       /*  error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }  */ 
	})
	return resultU;
}
</script>

<title>Insert title here</title>
</head>
<body>
	<h4>게시글 상세보기</h4>
	<form> 
		<div class="form-group">
	    	<label for="bno">글번호</label>
	    	<input id="bno" type="text" class="form-control" value="${board.bno}" readonly>
	    </div>	 
		<div class="form-group">
	    	<label for="btitle">제목</label>
	    	<input id="btitle" type="text" class="form-control" value="${board.btitle}" readonly>
	    </div>
		<div class="form-group">
	    	<label for="bwriter">작성자</label>
	    	<input id="bwriter" type="text" class="form-control" value="${board.bwriter}" readonly>
	    </div>	
		<div class="form-group">
	    	<label for="bhitcount">조회수</label>
	    	<input id="bhitcount" type="text" class="form-control" value="${board.hitcount}" readonly>
	    </div> 
		<div class="form-group">
	    	<label for="bdate">날짜</label>
	    	<input id="bdate" type="text" class="form-control" value="<fmt:formatDate value="${board.bdate}" pattern="yyyy년 MM월 dd일"/>" readonly>
	    </div>		           
	  	<div class="form-group">
	    	<label for="bcontent">내용</label>
	    	<textarea id="bcontent" class="form-control" rows="3" readonly>${board.bcontent}</textarea>
	  	</div>		
	</form>
	<a href="updateBoard?bno=${board.bno}"><input type="button" id="updateBoard" class="btn btn-default" value="수정"/></a>
	<a href="deleteBoard?bno=${board.bno}"><input type="button" id="deleteBoard" class="btn btn-default" value="삭제"/></a>
	<a href="boardList?pageNo=${pageNo}" class="btn btn-default" role="button">목록</a> 
	
	<!-- 댓글 목록 -->
	<h4>댓글</h4>
	<form method="post" action="updateComment" onsubmit="return checkUpdate();">
		<input type="hidden" name="bno" value="${board.bno}"/> 
		<input type="hidden" name="cno" value="${comment.cno}"/> 
		<div class="form-group">
	    	<label for="cwriter">작성자</label>
	    	<input id="cwriter" type="text" class="form-control" value="${comment.cwriter}" readonly>
	    </div>	 
	  	<div class="form-group">
	    	<label for="ccontent">내용</label>
	    	<textarea id="ccontent" name="ccontent" class="form-control" rows="3" placeholder="내용을 입력하세요">${comment.ccontent}</textarea>
	  	</div>
	    <div class="form-group">
	    	<label for="password">비밀번호</label>
	    	<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요"></input>
	  	</div>
	    <div>
	    	<input type="submit" class="btn btn-default" value="수정하기"/>
			<a href="boardDetail?bno=${board.bno}" class="btn btn-default" role="button">취소</a>
	    </div> 
	 </form>	

</body>
</html>