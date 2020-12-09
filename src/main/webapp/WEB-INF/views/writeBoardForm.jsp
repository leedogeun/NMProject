<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h5>게시물 입력</h5>
	<form method="post" action="writeBoard" >
		<div class="form-group">
	    	<label for="btitle">Title</label>
	    	<input id="btitle" name="btitle" type="text" class="form-control" placeholder="제목을 입력하세요">
	    </div>
	    <div class="form-group">
	   		<label for="bwriter">Writer</label>
	    	<input id="bwriter" name="bwriter" type="text" class="form-control" placeholder="글쓴이를 입력하세요">
	  	</div>
	  	<div class="form-group">
	    	<label for="bcontent">Content</label>
	    	<textarea id="bcontent" name="bcontent" class="form-control" rows="3" placeholder="내용을 입력하세요"></textarea>
	  	</div>
	  	<div class="form-group">
	  		<input type="submit" class="btn btn-secondary" value="글쓰기"/>
	  	</div>
	</form>	
</body>
</html>