<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center mb-4">공지사항 상세보기</h2>
		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>BOARD_ID</th>
					<td>${boardDTO.boardId}</td>
				</tr>
				<tr>
					<th>BOARD_TITLE</th>
					<td>${boardDTO.boardTitle}</td>
				</tr>
				<tr>
					<th>BOARD_CONTENT</th>
					<td>${boardDTO.boardContent}</td>
				</tr>
				<tr>
					<th>BOARD_AUTHOR</th>
					<td>${boardDTO.memberId}</td>
				</tr>
				<tr>
					<th>BOARD_CREATE</th>
					<td>${boardDTO.boardCreate}</td>
				</tr>
				<tr>
					<th>BOARD_UPDATE</th>
					<td>${boardDTO.boardUpdate}</td>
				</tr>
			</tbody>
		</table>

		<div class="text-center mt-4">
			<a href="/board/list" class="btn btn-primary mr-2">게시글 목록</a>
		</div>
	</div>
</body>
</html>