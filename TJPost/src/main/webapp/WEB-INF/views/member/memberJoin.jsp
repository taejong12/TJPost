<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
    <%@ include file="/WEB-INF/views/index.jsp"%>
    <div class="container mt-5 p-4 bg-light rounded shadow">
        <h2 class="text-center mb-4 text-primary">회원가입</h2>
        <form action="/member/join" method="post">
            <div class="form-group mb-3">
                <label for="memberId" class="form-label fw-bold">아이디</label>
                <input type="text" class="form-control form-control-lg" id="memberId" name="memberId" placeholder="아이디를 입력하세요" required>
            </div>
            <div class="form-group mb-3">
                <label for="memberPassword" class="form-label fw-bold">비밀번호</label>
                <input type="password" class="form-control form-control-lg" id="memberPassword" name="memberPassword" placeholder="비밀번호를 입력하세요" required>
            </div>
            <div class="form-group mb-3">
                <label for="memberPasswordCheck" class="form-label fw-bold">비밀번호 확인</label>
                <input type="password" class="form-control form-control-lg" id="memberPasswordCheck" name="memberPasswordCheck" placeholder="비밀번호를 다시 입력하세요" required>
                <!-- 🔴 경고문구 영역 -->
                <div id="passwordWarning" style="color: red; display: none; font-size: 0.9em; margin-top: 5px;">
                    비밀번호가 일치하지 않습니다.
                </div>
            </div>
            <div class="form-group mb-3">
                <label for="memberName" class="form-label fw-bold">이름</label>
                <input type="text" class="form-control form-control-lg" id="memberName" name="memberName" placeholder="이름을 입력하세요" required>
            </div>
            <div class="form-group mb-4">
                <label for="memberPhoneNumber" class="form-label fw-bold">휴대폰번호</label>
                <input type="tel" class="form-control form-control-lg" id="memberPhoneNumber" name="memberPhoneNumber" placeholder="휴대폰번호를 입력하세요" required>
            </div>
            <div class="form-group mb-4">
                <label for="memberEmail" class="form-label fw-bold">이메일</label>
                <input type="email" class="form-control form-control-lg" id="memberEmail" name="memberEmail" placeholder="이메일을 입력하세요" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-lg">회원가입</button>
            </div>
        </form>
    </div>

    <!-- 🔧 JS 수정 -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var form = document.querySelector('form');
            var passwordInput = document.getElementById('memberPassword');
            var passwordCheckInput = document.getElementById('memberPasswordCheck');
            var warningMessage = document.getElementById('passwordWarning');

            form.addEventListener('submit', function(event) {
                var password = passwordInput.value;
                var passwordCheck = passwordCheckInput.value;
                
                if (password !== passwordCheck) {
                    warningMessage.style.display = 'block';  // 🔴 경고문구 표시
                    passwordCheckInput.focus();
                    event.preventDefault(); // 폼 제출 취소
                } else {
                	alert('회원가입완료');
                    warningMessage.style.display = 'none';  // 🔴 경고문구 숨김
                }
            });

            // 🔧 비밀번호 확인 입력 시 실시간 체크
            passwordCheckInput.addEventListener('input', function() {
                if (passwordInput.value !== passwordCheckInput.value) {
                    warningMessage.style.display = 'block';
                } else {
                    warningMessage.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>