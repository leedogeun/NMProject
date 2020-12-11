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
	<h1>XXXXXXXXXXXXXXXXXX!controller에 commentList없음!XXXXXXXXXXXXXXXXXXXXXXXXX</h1>
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
	<a href="updateBoard?bno=${board.bno}" class="btn btn-default" role="button">수정</a>
	<a href="deleteBoard?bno=${board.bno}" class="btn btn-default" role="button">삭제</a>
	<a href="boardList?pageNo=${pageNo}" class="btn btn-default" role="button">목록</a>
	
	<!-- 댓글 목록 -->
	<h4>댓글</h4>
	<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<!-- <th scope="col">글번호</th>
				<th scope="col">댓글번호</th> -->
				<th scope="col">작성자</th>
				<th scope="col">댓글 내용</th>
				<th scope="col">날짜</th>
			</tr>
		</thead> 
		<tbody>
			<tr>
				<%-- <th scope="row">${bcomment.bno}</th>
				<th scope="row">${bcomment.cno}</th> --%>
				<td>${bcomment.cwriter}</td>
				<td>${bcomment.ccontent}</td>
				<td><fmt:formatDate value="${bcomment.cdate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</tbody>
	</table>	

	<%-- <a href="updateComment?cno=${comment.cno}" class="btn btn-default" role="button">수정</a>
	<a href="deleteComment?cno=${comment.cno}" class="btn btn-default" role="button">삭제</a> --%>
	<a href="boardList?pageNo=${pageNo}" class="btn btn-default" role="button">목록</a>	
	

</body>
</html>