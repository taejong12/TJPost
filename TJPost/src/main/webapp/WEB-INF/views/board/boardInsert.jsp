<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성하기 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/index.jsp"%>

	<div class="container mt-5 p-4 bg-light rounded shadow">
		<h2 class="text-center mb-4 text-primary">글 작성하기</h2>

		<form action="/board/write" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="form-group mb-3">
				<label for="boardTitle" class="form-label fw-bold">제목</label> <input
					type="text" class="form-control form-control-lg" id="boardTitle"
					name="boardTitle" placeholder="제목을 입력하세요" required>
			</div>
			<div class="form-group mb-3">
				<label for="boardContent" class="form-label fw-bold">내용</label>
				<textarea class="form-control form-control-lg" id="boardContent"
					name="boardContent" rows="6" placeholder="내용을 입력하세요" required></textarea>
			</div>
			<div class="form-group mb-4">
				<label for="boardAuthor" class="form-label fw-bold">작성자</label> <input
					type="text" class="form-control form-control-lg" id="boardAuthor"
					name="boardAuthor" placeholder="작성자를 입력하세요" required>
			</div>
			<div class="d-grid">
				<button type="submit" class="btn btn-primary btn-lg">작성하기</button>
			</div>
		</form>
	</div>

</body>
</html>