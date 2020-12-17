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
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 수정하기</h2>
	<form method="post" action="updateBoard">
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
	  		<input type="submit" class="btn btn-default" value="수정하기"/>
	  		<a href="boardDetail?bno=${board.bno}" class="btn btn-default" role="button">취소</a>
	  	</div>
	</form>		
</body>
</html>