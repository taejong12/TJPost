<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center mb-4">공지사항 상세보기</h2>
		<div class="card shadow p-4">
			<div class="row">
				<div class="col-md-6">
					<h4 class="mb-3">공지사항 정보</h4>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><strong>공지사항 번호:</strong> ${adminBoardDTO.boardId}</li>
						<li class="list-group-item"><strong>공지사항 제목:</strong> ${adminBoardDTO.boardTitle}</li>
						<li class="list-group-item"><strong>공지사항 내용:</strong> ${adminBoardDTO.boardContent}</li>
						<li class="list-group-item"><strong>공지사항 작성자:</strong> ${adminBoardDTO.memberId}</li>
						<li class="list-group-item"><strong>공지사항 작성일:</strong> ${adminBoardDTO.boardCreate}</li>
						<li class="list-group-item"><strong>공지사항 수정일:</strong> ${adminBoardDTO.boardUpdate}</li>
					</ul>
				</div>
				<div class="col-md-6 text-center">
					<h4 class="mb-3">첨부 파일</h4>
					<c:choose>
						<c:when test="${empty fileList}">
							<p class="text-muted">등록된 파일이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<div class="d-flex flex-wrap justify-content-center">
								<c:forEach var="file" items="${fileList}">
									<c:if test="${file.boardId == adminBoardDTO.boardId}">
										<div class="m-2">
											<img src="/img/board/${file.fileName}" width="100" class="rounded shadow">
											<p class="mt-2 small">${file.fileOriginalName}</p>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="text-center mt-4">
			<a href="/admin/board/update/${adminBoardDTO.boardId}" class="btn btn-primary mr-2">게시글 수정하기</a>
			<a href="/admin/board/delete/${adminBoardDTO.boardId}" class="btn btn-danger">게시글 삭제하기</a>
		</div>
	</div>
</body>
</html>