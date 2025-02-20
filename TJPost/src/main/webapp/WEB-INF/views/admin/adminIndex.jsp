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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>관리자 목차</title>
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
                    <a class="nav-link text-white" href="/admin/board/list">게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/product/list">상품</a>
                </li>
                <li class="nav-item ms-auto d-flex gap-2">
	                <a class="nav-link text-white" href="/member/logout">로그아웃</a>
                </li>
            </ul>
        
        </div>
     </header>
</body>
</html>