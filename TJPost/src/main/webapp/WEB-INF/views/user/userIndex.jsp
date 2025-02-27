<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/> <!-- CSRF 토큰 -->
<meta name="_csrf_header" content="${_csrf.headerName}"/> <!-- CSRF 헤더 이름 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body>
    <header class="sticky-top bg-white shadow-sm">
        <div class="container border">
        	
            <ul class="nav nav-underline bg-light py-2">
	            <li class="navbar-brand">
	            	<a href="/"> 
	            		<img src="/img/main/itbank.jpg" alt="메인로고" width="50px">
					</a>
	            </li>
            
			    <!-- 왼쪽에 위치한 카테고리 드롭다운 -->
			    <li class="nav-item">
			        <div class="dropdown">
			            <button class="btn btn-link nav-link dropdown-toggle text-decoration-none" type="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</button>
			            <ul class="dropdown-menu">
			                <li><a class="dropdown-item" href="#">이미지</a></li>
			                <li><a class="dropdown-item" href="#">이미지</a></li>
			                <li><a class="dropdown-item" href="#">이미지</a></li>
			                <li><a class="dropdown-item" href="#">이미지</a></li>
			            </ul>
			        </div>
			    </li>

			    <!-- 오른쪽 끝으로 정렬할 항목들 (d-flex로 묶어 간격 조정) -->
			    <li class="nav-item ms-auto d-flex gap-2">
			        <a class="nav-link" href="/cart/list">장바구니</a>
			        
			        <sec:authorize access="isAuthenticated()">
			            <a class="nav-link" href="/member/mypage">내정보</a>
			            <a class="nav-link" href="/member/logout">로그아웃</a>
			        </sec:authorize>
			
			        <sec:authorize access="isAnonymous()">
			            <a class="nav-link" href="/member/join">회원가입</a>
			            <a class="nav-link" href="/member/login">로그인</a>
			        </sec:authorize>
			
			    </li>
			</ul>

            <ul class="nav nav-underline bg-light py-2">
                <li class="nav-item">
                    <a class="nav-link" href="/">메인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/board/listPaging">공지사항</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/product/listPaging">상품</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Q&A</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">이벤트</a>
                </li>
                <!-- 관리자 페이지 (권한 체크) -->
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a target="_blank" class="nav-link" href="/admin/">관리자페이지</a>
                    </li>
                </sec:authorize>
            </ul>
            
	        <div class="input-group w-50 mx-auto">
	            <input type="text" class="form-control" placeholder="검색해주세요" />
	            <button class="btn btn-outline-secondary" type="button">
	                <img src="https://img.icons8.com/ios/50/000000/search.png" alt="검색" style="width: 20px; height: 20px;">
	            </button>
	        </div>
        </div>
    </header>
</body>
</html>
