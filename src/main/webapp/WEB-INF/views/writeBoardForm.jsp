<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		var pw = $("#bpassword").val();
		if(pw == "") {
			// $("#bpasswordError").text("비밀번호를 입력하세요."); // span 부분에 에러메세지 내용이 나타난다.  
			alert("비밀번호를 입력하세요"); 
			return false;
		}
		return true;
	}	
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 작성하기</h2>
	<form method="post" action="writeBoard" onsubmit="return checkForm()"> <!-- onsubmit의 값이 true여야 action실행 -->
		<div class="form-group">
	    	<label for="btitle">제목</label>
	    	<input id="btitle" name="btitle" type="text" class="form-control" placeholder="제목을 입력하세요">
	    </div>
	    <div class="form-group">
	   		<label for="bwriter">작성자</label>
	    	<input id="bwriter" name="bwriter" type="text" class="form-control" placeholder="작성자를 입력하세요">
	  	</div>
	  	<div class="form-group">
	    	<label for="bcontent">내용</label>
	    	<textarea id="bcontent" name="bcontent" class="form-control" rows="3" placeholder="내용을 입력하세요"></textarea>
	  	</div>
	  	<div class="form-group">
	  		<label for="bpassword">비밀번호</label>
	  		<input id="bpassword" name="bpassword" type="password" class="form-control" placeholder="비밀번호를 입력하세요">
	  		<span id="bpasswordError" class="error" style="color:red"></span> 
	  	</div>
	  	<div class="form-group">
	  		<input type="submit" class="btn btn-default" value="작성하기"/> 
	  		<a href="boardList?pageNo=${pageNo}"><input type="button" class="btn btn-default" value="목록"/></a>
	  	</div>
	</form>	
</body>
</html>