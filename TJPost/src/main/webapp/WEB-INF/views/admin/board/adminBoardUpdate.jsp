<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 수정 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center mb-4">공지사항 수정하기</h2>
		<form action="/admin/board/update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<table class="table table-striped table-bordered">
				<thead class="thead-dark">
					<tr>
						<th>항목</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>공지사항 번호</th>
						<td><input type="text" id="boardId" name="boardId" value="${boardDTO.boardId}" class="form-control" readonly></td>
					</tr>
					<tr>
						<th>공지사항 제목</th>
						<td><input type="text" id="boardTitle" name="boardTitle" value="${boardDTO.boardTitle}" class="form-control"></td>
					</tr>
					<tr>
						<th>공지사항 내용</th>
						<td><textarea id="boardContent" name="boardContent" class="form-control" rows="5">${boardDTO.boardContent}</textarea></td>
					</tr>
					<tr>
						<th>공지사항 작성자</th>
						<td><input type="text" id="memberId" name="memberId" value="${boardDTO.memberId}" class="form-control"></td>
					</tr>
					<tr>
						<th>공지사항 작성일</th>
						<td><input type="text" id="boardCreate" name="boardCreate" value="${boardDTO.boardCreate}" class="form-control" readonly></td>
					</tr>
					<tr>
						<th>공지사항 수정일</th>
						<td><input type="text" id="boardUpdate" name="boardUpdate" value="${boardDTO.boardUpdate}" class="form-control" readonly></td>
					</tr>
					<tr>
						<th>공지사항 파일</th>
						<td><input type="file" id="boardFiles" name="boardFiles" class="form-control" multiple></td>
						<c:choose>
							<c:when test="${empty fileList}">
								<td>파일없음</td>
							</c:when>
							<c:otherwise>
								<c:forEach items="fileList" >
									<th>파일이름</th>
									<td>${fileList.boardFiles}</td>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tr>
				</tbody>
			</table>

			<div class="text-center mt-4">
				<button type="submit" class="btn btn-success mr-2">수정 완료</button>
				<a href="/admin/board/detail/${boardDTO.boardId}" class="btn btn-secondary">취소</a>
			</div>
		</form>
	</div>
</body>
</html>