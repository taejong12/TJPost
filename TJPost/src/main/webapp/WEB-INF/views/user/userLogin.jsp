<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/index.jsp"%>

	<div class="container d-flex justify-content-center align-items-center"
		style="height: 100vh;">
		<div class="col-md-6 col-lg-4">
			<div class="card shadow border-0 p-4">
				<h3 class="text-center text-primary mb-4">로그인</h3>
				<form action="/user/login" method="post">
					<div class="mb-3">
						<label for="userID" class="form-label">아이디</label> <input
							type="text" class="form-control" id="userID" name="userID"
							placeholder="아이디를 입력하세요" maxlength="20" required>
					</div>

					<div class="mb-3">
						<label for="userPassword" class="form-label">비밀번호</label> <input
							type="password" class="form-control" id="userPassword"
							name="userPassword" placeholder="비밀번호를 입력하세요" maxlength="20"
							required>
					</div>

					<div class="d-grid mb-3">
						<button type="submit" class="btn btn-primary btn-lg">로그인</button>
					</div>
				</form>

				<div class="text-center">
					<a href="/user/join" class="btn btn-outline-primary btn-sm w-100">회원가입</a>
				</div>
			</div>
		</div>
	</div>

</body>

</html>