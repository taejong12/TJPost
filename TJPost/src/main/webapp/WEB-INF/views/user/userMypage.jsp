<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>마이 페이지</title>
	</head>
	
	<body>
		<%@ include file="/WEB-INF/views/index.jsp" %>
		<div class="container mt-5 p-4 bg-light rounded shadow">
		    <h2 class="text-center mb-4 text-primary">마이페이지 정보 수정</h2>
		    <form action="/user/update" method="post">
		        <!-- 아이디 입력 -->
		        <div class="form-group mb-3">
		            <label for="memberId" class="form-label fw-bold">아이디</label>
		            <input 
		                type="text" 
		                class="form-control form-control-lg" 
		                id="memberId" 
		                name="memberId" 
		                placeholder="아이디를 입력하세요" 
		                value="사용자의 현재 아이디" 
		                readonly>
		            <small class="text-muted">아이디는 수정할 수 없습니다.</small>
		        </div>
		
		        <!-- 비밀번호 입력 -->
		        <div class="form-group mb-3">
		            <label for="memberPassword" class="form-label fw-bold">새 비밀번호</label>
		            <input 
		                type="password" 
		                class="form-control form-control-lg" 
		                id="memberPassword" 
		                name="memberPassword" 
		                placeholder="새 비밀번호를 입력하세요" 
		                required>
		            <small class="text-muted">비밀번호는 안전하게 관리해주세요.</small>
		        </div>
		
		        <!-- 이름 입력 -->
		        <div class="form-group mb-3">
		            <label for="memberName" class="form-label fw-bold">이름</label>
		            <input 
		                type="text" 
		                class="form-control form-control-lg" 
		                id="memberName" 
		                name="memberName" 
		                placeholder="이름을 입력하세요" 
		                value="사용자의 현재 이름" 
		                required>
		        </div>
		
		        <!-- 이메일 입력 -->
		        <div class="form-group mb-4">
		            <label for="memberEmail" class="form-label fw-bold">이메일</label>
		            <input 
		                type="email" 
		                class="form-control form-control-lg" 
		                id="memberEmail" 
		                name="memberEmail" 
		                placeholder="이메일을 입력하세요" 
		                value="사용자의 현재 이메일" 
		                required>
		        </div>
		
		        <!-- 수정 버튼 -->
		        <div class="d-grid">
		            <button type="submit" class="btn btn-primary btn-lg">정보 수정</button>
		        </div>
		    </form>
		</div>
		
	</body>
</html>