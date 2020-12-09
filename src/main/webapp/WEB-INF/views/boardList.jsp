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
	<h2>게시판</h2>
	<table class="table table-bordered table-hover">
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
	<div><a class="btn btn-default" href="writeBoardForm" role="button">작성하기</a></div>	
</body>
</html>