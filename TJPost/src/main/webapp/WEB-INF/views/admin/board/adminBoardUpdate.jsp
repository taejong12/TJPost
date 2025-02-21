<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 수정 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>

	<div class="container mt-5 mb-5">
		<h2 class="text-center mb-4">공지사항 수정하기</h2>
		<div class="card shadow p-4">
			<form action="/admin/board/update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="boardId" value="${boardDTO.boardId}">
				<div class="row mb-3">
					<div class="col-md-6">
						<label class="form-label">공지사항 번호</label>
						<p class="form-control-plaintext border p-2 bg-light">${boardDTO.boardId}</p>
					</div>
					<div class="col-md-6">
						<label class="form-label">작성자</label>
						<p class="form-control-plaintext border p-2 bg-light">${boardDTO.memberId}</p>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-6">
						<label class="form-label">작성일</label>
						<p class="form-control-plaintext border p-2 bg-light">${boardDTO.boardCreate}</p>
					</div>
					<div class="col-md-6">
						<label class="form-label">수정일</label>
						<p class="form-control-plaintext border p-2 bg-light">${boardDTO.boardUpdate}</p>
					</div>
				</div>
				<div class="mb-3">
					<label for="boardTitle" class="form-label">공지사항 제목</label>
					<input type="text" id="boardTitle" name="boardTitle" value="${boardDTO.boardTitle}" class="form-control">
				</div>
				<div class="mb-3">
					<label for="boardContent" class="form-label">공지사항 내용</label>
					<textarea id="boardContent" name="boardContent" class="form-control" rows="5">${boardDTO.boardContent}</textarea>
				</div>
				<div class="mb-3">
					<label for="boardFiles" class="form-label">공지사항 파일</label>
					<input type="file" id="boardFiles" name="boardFiles" class="form-control" multiple>
					<c:choose>
						<c:when test="${empty fileList}">
							<p class="text-muted">등록된 파일이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<ul class="list-group mt-2">
								<c:forEach var="file" items="${fileList}">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span>${file.fileOriginalName}</span>
									</li>
								</c:forEach>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="text-center mt-4">
					<button type="submit" class="btn btn-success">수정 완료</button>
					<a href="/admin/board/detail/${boardDTO.boardId}" class="btn btn-secondary">취소</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>