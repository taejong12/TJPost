<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
/댓글/인기순/최근순
	<div class="container mt-5">
		<h2 class="text-center">공지사항</h2>

		<table id="boardTable" class="table table-bordered">
			<tr>
				<td id="boardId">공지사항 번호</td>
				<td id="boardTitle">제목</td>
				<td id="boardContent">내용</td>
				<td id="memberId">작성자</td>
				<td id="boardCreate">작성일자</td>

			</tr>
			<c:choose>
				<c:when test="${empty boardList}">
					<tr>
						<td colspan="5">등록된 게시물이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>${board.boardId}</td>
							<td><a href="/board/detail/${board.boardId}">${board.boardTitle}</a>
							</td>
							<td>${board.boardContent}</td>
							<td>${board.memberId}</td>
							<td>${board.boardCreate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>