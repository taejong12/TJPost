<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>회원가입 페이지</title>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
    <div class="container mt-5 p-4 bg-light rounded shadow">
        <h2 class="text-center mb-4 text-primary">회원가입</h2>
        <form action="/member/join" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="form-group mb-3">
                <label for="memberId" class="form-label fw-bold">아이디</label>
                <input type="text" class="form-control form-control-lg" id="memberId" name="memberId" placeholder="아이디를 입력하세요" required>
                <!-- 🔴 경고문구 영역 -->
                <div id="idCreating" style="color: green; display: none; font-size: 0.9em; margin-top: 5px;">
                    생성 가능한 아이디입니다.
                </div>
                <!-- 🔴 경고문구 영역 -->
                <div id="idWarning" style="color: red; display: none; font-size: 0.9em; margin-top: 5px;">
                    이미 존재하는 아이디입니다.
                </div>
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
            var passwordWarningMessage = document.getElementById('passwordWarning');

            form.addEventListener('submit', function(event) {
                var password = passwordInput.value;
                var passwordCheck = passwordCheckInput.value;
                
                // 비밀번호 일치여부 확인
                if (password !== passwordCheck) {
                	passwordWarningMessage.style.display = 'block';  // 🔴 경고문구 표시
                    passwordCheckInput.focus();
                    event.preventDefault(); // 폼 제출 취소
                // 아이디 중복여부 확인
                } else if($("#idCreating").css("display") !== "block"){
					$("#memberId").focus();
					event.preventDefault(); // 폼 제출 취소
                } else {
                	alert('회원가입완료');
                }
            });

            // 🔧 비밀번호 확인 입력 시 실시간 체크
            passwordCheckInput.addEventListener('input', function() {
                if (passwordInput.value !== passwordCheckInput.value) {
                	passwordWarningMessage.style.display = 'block';
                } else {
                	passwordWarningMessage.style.display = 'none';
                }
            });
        });
        
      //회원가입 창에서 아이디를 입력하고 커서가 다른 곳으로 이동하면 이벤트 발생
		$("#memberId").on('blur', function() {  // blur 이벤트 사용 (커서가 입력창을 떠날 때)
			var csrfToken = $("meta[name='_csrf']").attr("content");
		    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		
		    $.ajax({
		        url: '/member/memberIdCheck', // 요청할 URL
		        type: 'POST', // HTTP 메서드 (GET, POST 등)
		        data: { // 서버로 보낼 데이터
		            memberId: $("#memberId").val()  // jQuery에서 .val()을 사용하여 값을 가져옴
		        },
		        beforeSend: function(xhr) {
		            // CSRF 토큰을 헤더에 추가
		            xhr.setRequestHeader(csrfHeader, csrfToken);
		        },
		        success: function(idCreating) { // 요청이 성공했을 때 실행되는 콜백 함수
		            console.log('아이디 확인 성공:', idCreating);
		        	
		        	if(idCreating){
		        		// 아이디 생성 가능
		        		$("#idCreating").css("display", "block");
		        		$("#idWarning").css("display", "none");
		        	}else{
		        		$("#idCreating").css("display", "none");
		        		$("#idWarning").css("display", "block");
		        	}
		            // response에 따라 중복 체크 결과를 화면에 표시할 수 있음
		        },
		        error: function(xhr, status, error) { // 요청이 실패했을 때 실행되는 콜백 함수
		            console.log('아이디 확인 에러:', error);
		        }
		    });
		});
    </script>
</body>
</html>