<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<!-- Bootstrap JavaScript Bundle (Includes Popper.js) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- 헤더 링크 -->
	<ul class="nav nav-underline bg-light py-2">

		<li class="nav-item">
			<a class="nav-link" href="/">메인</a>
		</li>

		<li class="nav-item">
			<a class="nav-link" href="/board/list">게시판</a>
		</li>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li class="nav-item">
				<a target="_blank" class="nav-link" href="/admin/">관리자페이지</a>
			</li>
		</sec:authorize>

		<!-- 버튼 오른쪽 끝으로 이동 -->
		<li class="nav-item ms-auto">
			<!-- 접속하기 버튼 -->
			<div class="dropdown">

				<button class="btn btn-link nav-link dropdown-toggle text-decoration-none" type="button" data-bs-toggle="dropdown" aria-expanded="false">접속하기</button>

				<ul class="dropdown-menu">
				    <sec:authorize access="isAuthenticated()">
				        <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
				        <li><a class="dropdown-item" href="/member/mypage">마이페이지</a></li>
				    </sec:authorize>
				    <sec:authorize access="isAnonymous()">
				        <li><a class="dropdown-item" href="/member/join">회원가입</a></li>
				        <li><a class="dropdown-item" href="/member/login">로그인</a></li>
				    </sec:authorize>
				</ul>
			</div>
		</li>
	</ul>
</body>
</html>