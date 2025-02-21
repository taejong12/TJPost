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
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center">공지사항</h2>

		<table id="boardTable" class="table table-bordered">
			<tr>
				<td id="boardId">공지사항 고유번호</td>
				<td id="boardTitle">제목</td>
				<td id="boardContent">내용</td>
				<td id="memberId">작성자</td>
				<td id="boardCreate">작성일자</td>

			</tr>
			<c:choose>
				<c:when test="${empty adminBoardList}">
					<tr>
						<td colspan="5">등록된 공지사항이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="adminBoard" items="${adminBoardList}">
						<tr>
							<td>${adminBoard.boardId}</td>
							<td><a href="/admin/board/detail/${adminBoard.boardId}">${adminBoard.boardTitle}</a>
							</td>
							<td>${adminBoard.boardContent}</td>
							<td>${adminBoard.memberId}</td>
							<td>${adminBoard.boardCreate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<a href="/admin/board/insert" class="btn btn-primary mb-3">공지사항 작성하기</a>
	</div>
</body>
</html>