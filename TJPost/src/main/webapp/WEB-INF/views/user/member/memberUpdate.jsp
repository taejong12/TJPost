<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	<div class="container mt-5 mb-5">
	<div class="row">
		<%@ include file="/WEB-INF/views/user/member/memberSidebar.jsp"%>
		<div class="col-md-9">
			<form action="/member/update" method="post" class="section p-4 bg-light rounded shadow-sm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="memberId" value="${memberDTO.memberId}">
				<h3 class="mb-4">내 정보</h3>
				<div class="mb-3">
					<label for="memberPhoneNumber" class="form-label"><strong>핸드폰번호</strong></label>
					<input type="tel" class="form-control" id="memberPhoneNumber" name="memberPhoneNumber" value="${memberDTO.memberPhoneNumber}">
				</div>
				<div class="mb-3">
					<label for="memberEmail" class="form-label"><strong>이메일</strong></label>
					<input type="email" class="form-control" id="memberEmail" name="memberEmail" value="${memberDTO.memberEmail}">
				</div>
				<div class="d-grid">
					<button type="submit" class="btn btn-success btn-lg">회원수정</button>
					<a href="/member/delete/${memberDTO.memberId}" class="btn btn-danger mt-3">회원탈퇴</a>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>