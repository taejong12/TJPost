<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/> <!-- CSRF 토큰 -->
<meta name="_csrf_header" content="${_csrf.headerName}"/> <!-- CSRF 헤더 이름 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>관리자 헤더</title>
</head>
<body>
     <header class="sticky-top bg-white shadow-sm">
        <div class="container mt-5 bg-secondary py-3">
        	<ul class="nav nav-pills">
        		<li class="navbar-brand">
	            	<a href="/admin/"> 
	            		<img src="/img/main/itbank.jpg" alt="메인로고" width="50px">
					</a>
	            </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/">메인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/member/listPaging">회원관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/board/listPaging">공지사항관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/product/listPaging">상품관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/Q&A/listPaging">Q&A관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/orders/listPaging">주문내역관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/delivery/listPaging">배송관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/event/listPaging">이벤트관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/coupon/listPaging">쿠폰관리</a>
                </li>
                <li class="nav-item ms-auto d-flex gap-2">
	                <a class="nav-link text-white" href="/member/logout">로그아웃</a>
                </li>
            </ul>
        	<!-- 검색 폼 추가 -->
        	<div class="d-flex mt-3 justify-content-center">
                <!-- 검색어 입력 -->
        		<form class="d-flex" action="/admin/search" method="get">
                    <input type="text" class="form-control" placeholder="검색 ㄱㄱ" name="searchKeyword" value="${searchKeyword}"/>
                    <button class="btn btn-outline-secondary" type="submit">
                        <img src="https://img.icons8.com/ios/50/000000/search.png" alt="검색" style="width: 20px; height: 20px;">
                    </button>
                </form>
            </div>
        </div>
     </header>
</body>
</html>