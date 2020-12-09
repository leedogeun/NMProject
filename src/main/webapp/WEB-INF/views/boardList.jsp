<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h5>게시물 리스트</h5>
	<table class="table table-sm">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<th scope="row">${board.bno}</th>
					<td>${board.btitle}</td>
					<td>${board.bwriter}</td>
					<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
					<td>${board.bhitcount}</td>
				</tr>
		</tbody>
	</table>	
	<div><a href="writeBoardForm" class="btn btn-secondary">글쓰기</a></div>	
</body>
</html>