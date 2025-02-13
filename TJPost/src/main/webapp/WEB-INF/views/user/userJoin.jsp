<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<%-- <script type="text/javascript">
	        window.onload = function() {
	            
	            var message = "<%= request.getAttribute('message') %>";
	            
	            if (message) {
	                alert(message);  // 알림창에 메시지 출력
	                // 알림 후 페이지 이동, 예: 회원가입 폼 페이지로 돌아가기
	                window.location.href = "/user/join";  // 페이지 이동
	            }
	        }
	    </script> --%>

</head>

<body>
	<%@ include file="/WEB-INF/views/index.jsp"%>
	<div class="container mt-5 p-4 bg-light rounded shadow">
		<h2 class="text-center mb-4 text-primary">회원가입</h2>
		<form action="/user/join" method="post">
			<div class="form-group mb-3">
				<label for="memberId" class="form-label fw-bold">아이디</label> <input
					type="text" class="form-control form-control-lg" id="memberId"
					name="memberId" placeholder="아이디를 입력하세요" required>
			</div>
			<div class="form-group mb-3">
				<label for="memberPassword" class="form-label fw-bold">비밀번호</label>
				<input type="password" class="form-control form-control-lg"
					id="memberPassword" name="memberPassword" placeholder="비밀번호를 입력하세요"
					required>
			</div>
			<div class="form-group mb-3">
				<label for="memberName" class="form-label fw-bold">이름</label> <input
					type="text" class="form-control form-control-lg" id="memberName"
					name="memberName" placeholder="이름을 입력하세요" required>
			</div>
			<div class="form-group mb-4">
				<label for="memberEmail" class="form-label fw-bold">이메일</label> <input
					type="email" class="form-control form-control-lg" id="memberEmail"
					name="memberEmail" placeholder="이메일을 입력하세요" required>
			</div>
			<div class="d-grid">
				<button type="submit" class="btn btn-primary btn-lg">회원가입</button>
			</div>
		</form>
	</div>

</body>
</html>