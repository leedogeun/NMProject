<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h3>게시물 상세보기</h3>
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
	  	<%-- <div class="form-group">
	    	<label for="bcomment">댓글</label>
	    	<textarea id="bcomment" class="form-control" rows="3" readonly>${board.bcomment} 댓글</textarea>
	  	</div>	 --%>  		
	</form>
	<a href="updateBoard?bno=${board.bno}" class="btn btn-default" role="button">수정</a>
	<a href="deleteBoard?bno=${board.bno}" class="btn btn-default" role="button">삭제</a>
	<a href="boardList?pageNo=${pageNo}" class="btn btn-default" role="button">목록</a>
	
	<h3>댓글</h3>
	<form method="post" action="writeComment" >
		<div class="form-group">
			<input type="hidden" name="bno" value="${board.bno}"/>
	    	<input id="bcomment" name="bcomment" type="text" class="form-control" placeholder="댓글을 남기시려면 작성해주세요.">
	    	<input type="submit" class="btn btn-default" value="작성하기"/>
	    	<a href="updateBoard?bno=${board.bno}" class="btn btn-default" role="button">수정</a>
			<a href="deleteBoard?bno=${board.bno}" class="btn btn-default" role="button">삭제</a>
			<a href="boardList?pageNo=${pageNo}" class="btn btn-default" role="button">목록</a>	 
	  	</div>
	</form>
	
	
</body>
</html>