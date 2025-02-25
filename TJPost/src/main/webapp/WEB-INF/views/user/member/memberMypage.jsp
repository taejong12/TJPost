<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>

	<div class="container mt-5 mb-5">
		<div class="row">
			<%@ include file="/WEB-INF/views/user/member/memberSidebar.jsp"%>
			<!-- Main Content -->
			<div class="col-md-9">
				<div class="section p-4 bg-light rounded shadow-sm">
					<h3 class="mb-4">내 정보</h3>
					<div class="mb-3">
						<strong>아이디</strong>
						<p class="text-muted">${memberDTO.memberId}</p>
					</div>
					<div class="mb-3">
						<strong>이름</strong>
						<p class="text-muted">${memberDTO.memberName}</p>
					</div>
					<div class="mb-3">
						<strong>핸드폰번호</strong>
						<p class="text-muted">${memberDTO.memberPhoneNumber}</p>
					</div>
					<div class="mb-3">
						<strong>이메일</strong>
						<p class="text-muted">${memberDTO.memberEmail}</p>
					</div>
					<div class="d-grid mb-3 text-center">
						<a href="/member/update" class="btn btn-outline-primary btn-sm w-100">회원수정 페이지</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
