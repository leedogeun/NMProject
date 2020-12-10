<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<th scope="row">${board.bno}</th>
						<td><a href="boardDetail?bno=${board.bno}">${board.btitle}</a></td>
						<td>${board.bwriter}</td>
						<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
						<td>${board.hitcount}</td>
					</tr>
				</c:forEach> 
		</tbody>
	</table>
	<div style="display: flex;">
		<div style="flex-grow: 1;">
			<a href="boardList?pageNo=1" class="btn btn-default">처음</a>
			<c:if test="${groupNo>1}">
				<a href="boardList?pageNo=${startPageNo-1}" class="btn btn-default">이전</a>
			</c:if>
			<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
				<div class="btn-group mr-2" role="group" aria-label="First group">
					<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
						<c:if test="${pageNo==i}">
							<a href="boardList?pageNo=${i}" class="btn btn-secondary active" >${i}</a>
						</c:if>
						<c:if test="${pageNo!=i}">
							<a href="boardList?pageNo=${i}" class="btn btn-secondary" >${i}</a>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<c:if test="${groupNo<totalGroupNum}">
				<a href="boardList?pageNo=${endPageNo+1}" class="btn btn-default">다음</a>  <%-- 다음 그룹으로 넘어감 --%>
				<%-- <a href="boardList?pageNo=${pageNo+1}" class="btn btn-default">다음</a> --%>  <%-- 다음 페이지로 넘어감 --%>
			</c:if>
			<a href="boardList?pageNo=${totalPageNum}" class="btn btn-default">맨끝</a>
			<div>  
				<a class="btn btn-default" href="writeBoardForm" role="button">글 쓰기</a>
			</div>
		</div>
	</div>	
</body>
</html>