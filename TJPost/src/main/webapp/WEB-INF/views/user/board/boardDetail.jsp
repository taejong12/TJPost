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
		<div class="card shadow p-4">
			<div class="row">
				<div class="col-md-6">
					<h4 class="mb-3">공지사항 정보</h4>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><strong>공지사항 번호:</strong> ${boardDTO.boardId}</li>
						<li class="list-group-item"><strong>공지사항 제목:</strong> ${boardDTO.boardTitle}</li>
						<li class="list-group-item"><strong>공지사항 내용:</strong> ${boardDTO.boardContent}</li>
						<li class="list-group-item"><strong>공지사항 작성자:</strong> ${boardDTO.memberId}</li>
						<li class="list-group-item"><strong>공지사항 작성일:</strong> ${boardDTO.boardCreate}</li>
						<li class="list-group-item"><strong>공지사항 수정일:</strong> ${boardDTO.boardUpdate}</li>
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
									<c:if test="${file.boardId == boardDTO.boardId}">
										<div class="m-2">
											<img src="/img/board/${file.fileName}" width="100" class="rounded shadow">
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
			<a href="/board/listPaging" class="btn btn-primary mr-2">공지사항 목록</a>
		</div>
	</div>
	
</body>
</html>