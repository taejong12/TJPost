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
				
				<form action="/member/login" method="post">
					<!-- CSRF 토큰 설정 -->
					<input type="hidden" name="_csrf" value="${_csrf.token}">
					
					<div class="mb-3">
						<label for="memberId" class="form-label">아이디</label> 
						<input type="text" class="form-control" id="memberId" name="memberId"
							placeholder="아이디를 입력하세요" maxlength="20" required>
					</div>

					<div class="mb-3">
						<label for="memberPassword" class="form-label">비밀번호</label> 
						<input type="password" class="form-control" id="memberPassword"
							name="memberPassword" placeholder="비밀번호를 입력하세요" maxlength="20"
							required>
					</div>

					<div class="d-grid mb-3">
						<button type="submit" class="btn btn-primary btn-lg">로그인</button>
					</div>
				</form>

				<div class="d-grid mb-3 text-center">
					<a href="/member/join" class="btn btn-outline-primary btn-sm w-100">회원가입</a>
				</div>
				
				<div class="mb-3 text-center">
					<a href="/oauth2/authorization/kakao">
						<img width="300" height="47.6" alt="kakao" src="/img/kakao_login_btn.png">
					</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
