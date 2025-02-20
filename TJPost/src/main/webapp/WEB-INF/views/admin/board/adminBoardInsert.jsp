<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>

	<div class="container mt-5 p-4 bg-light rounded shadow">
		<h2 class="text-center mb-4 text-primary">공지사항 작성</h2>

		<form action="/admin/board/insert" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="form-group mb-3">
				<label for="boardTitle" class="form-label fw-bold">제목</label> 
				<input type="text" class="form-control form-control-lg" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요" required>
			</div>
			<div class="form-group mb-3">
				<label for="boardContent" class="form-label fw-bold">내용</label>
				<textarea class="form-control form-control-lg" id="boardContent" name="boardContent" rows="6" placeholder="내용을 입력하세요" required></textarea>
			</div>
			<div class="form-group mb-4">
				<label for="boardFiles" class="form-label fw-bold">파일</label> 
				<input type="file" class="form-control form-control-lg" id="boardFiles" name="boardFiles" multiple>
			</div>
			<div class="d-grid">
				<button type="submit" class="btn btn-primary btn-lg">공지사항 등록</button>
			</div>
		</form>
	</div>

</body>
</html>