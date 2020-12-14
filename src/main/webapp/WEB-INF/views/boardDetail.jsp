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
	<c:if test="${not empty bcomment}"> <!-- 댓글이 있다면 해당하는 게시물의 댓글을 보여줌 -->
	<h4>댓글</h4>
	<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th scope="col">작성자</th>
				<th scope="col">댓글 내용</th>
				<th scope="col">날짜</th>
				<th scope="col"></th>
			</tr>
		</thead> 
		<tbody>
			<tr>
				<td>${bcomment.cwriter}</td>
				<td>${bcomment.ccontent}</td>
				<td><fmt:formatDate value="${bcomment.cdate}" pattern="yyyy-MM-dd" /></td>
				<td><a href="updateComment?cno=${comment.cno}" class="btn btn-default" role="button">수정</a>
					<a href="deleteComment?cno=${comment.cno}" class="btn btn-default" role="button">삭제</a>
				</td>
			</tr>
		</tbody>
	</table>	
	</c:if>
	<c:if test="${empty bcomment}"> <!-- 해당하는 게시물의 댓글이 없다면 댓글을 작성하는 폼 보여줌 -->
	<h4>댓글 작성하기</h4>
	<form method="post" action="writeComment">
	    <div class="form-group">
	   		<label for="cwriter">댓글 작성자</label>
	    	<input id="cwriter" name="cwriter" type="text" class="form-control" placeholder="댓글 작성자">
	  	</div>
	  	<div class="form-group">
	    	<label for="ccontent">댓글 내용</label>
	    	<textarea id="ccontent" name="ccontent" class="form-control" rows="3" placeholder="댓글을 작성해주세요."></textarea>
	  	</div>
	  	<div class="form-group">
	  		<input type="hidden" name="bno" value="${board.bno}"/> <!-- cno값 들어가게 하기 위해 bno값 hidden 사용 -->
	  		<input type="submit" class="btn btn-default" value="댓글 작성하기"/> 
	  	</div>
	</form>		
	</c:if> 
</body>
</html>