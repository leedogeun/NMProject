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
	function checkForm() { // 비밀번호를 입력했는지 확인
		var pw = $("#cpassword").val();
		if(pw == "") {
			// $("#cpasswordError").text("비밀번호를 입력하세요."); // span 부분에 에러메세지 내용이 나타난다.  
			alert("비밀번호를 입력하세요"); 
			return false;
		}
		return true;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<h4>게시물 상세보기</h4>
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
	<c:if test="${not empty bcomment}"> <!-- 해당하는 게시글의 댓글이 있다면 댓글을 보여줌 -->
	<h4>댓글 목록</h4>
		<div class="form-group">
	    	<label for="cwriter">작성자</label>
	    	<input id="cwriter" type="text" class="form-control" value="${bcomment.cwriter}" readonly>
	    </div>	 
	  	<div class="form-group">
	    	<label for="ccontent">내용</label>
	    	<textarea id="ccontent" class="form-control" rows="3" readonly>${bcomment.ccontent}</textarea>
	  	</div>	
		<div class="form-group">
	    	<label for="cdate">날짜</label>
	    	<input id="cdate" type="text" class="form-control" value="<fmt:formatDate value="${bcomment.cdate}" pattern="yyyy년 MM월 dd일"/>" readonly>
	    </div>
	    <div>
	    	<a href="updateCommentForm?bno=${board.bno}" class="btn btn-default" role="button">수정</a>
			<a href="deleteComment?bno=${board.bno}" class="btn btn-default" role="button">삭제</a>
	    </div> 	           				
	</c:if>
	
	<!-- 댓글 작성 -->
	<c:if test="${empty bcomment}"> <!-- 해당하는 게시글의 댓글이 없다면 댓글을 작성하는 폼 보여주기 -->
	<h4>댓글 작성하기</h4>
	<form method="post" action="writeComment" onsubmit="return checkForm()">
	    <div class="form-group">
	   		<label for="cwriter">댓글 작성자</label>
	    	<input id="cwriter" name="cwriter" type="text" class="form-control" placeholder="댓글 작성자">
	  	</div>
	  	<div class="form-group">
	    	<label for="ccontent">댓글 내용</label>
	    	<textarea id="ccontent" name="ccontent" class="form-control" rows="3" placeholder="댓글을 작성해주세요."></textarea>
	  	</div>
	  	<div class="form-group">
	  		<label for="cpassword">비밀번호</label>
	  		<input id="cpassword" name="cpassword" type="password" class="form-control" placeholder="비밀번호를 입력하세요">
	  		<span id="cpasswordError" class="error" style="color:red"></span> 
	  	</div>
	  	<div class="form-group">
	  		<input type="hidden" name="bno" value="${board.bno}"/> <!-- cno값 들어가게 하기 위해 bno값 hidden 사용 -->
	  		<input type="submit" class="btn btn-default" value="댓글 작성하기"/> 
	  	</div>
	</form>		
	</c:if> 
</body>
</html>