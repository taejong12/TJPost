<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과 목록 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>
	
	<div class="container mt-5 mb-5">
		<h2>검색 결과</h2>
		<p>검색어: <strong>${searchKeyword}</strong></p>

		<!-- 상품 결과 -->
		<h3 class="mt-4">상품</h3>
		<c:if test="${not empty productListSearch}">
			<div class="row">
				<c:forEach var="product" items="${productListSearch}">
					<div class="col-md-4 mb-3">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">${product.productId}</h5>
								<a href="/admin/product/detail/${product.productName}">${product.productName}</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty productListSearch}">
			<p>검색된 상품이 없습니다.</p>
		</c:if>

		<!-- 게시판 결과 -->
		<h3 class="mt-4">공지사항</h3>
		<c:if test="${not empty boardListSearch}">
			<div class="row">
				<c:forEach var="board" items="${boardListSearch}">
					<div class="col-md-4 mb-3">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">${board.boardId}</h5>
								<a href="/admin/board/detail/${board.boardId}">${board.boardTitle}</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty boardListSearch}">
			<p>검색된 공지사항이 없습니다.</p>
		</c:if>

		<!-- 회원 결과 -->
		<h3 class="mt-4">회원</h3>
		<c:if test="${not empty memberListSearch}">
			<ul class="list-group">
				<c:forEach var="member" items="${memberListSearch}">
					<li class="list-group-item">${member.memberId}</li>
				</c:forEach>
			</ul>
		</c:if>
		<c:if test="${empty memberListSearch}">
			<p>검색된 회원이 없습니다.</p>
		</c:if>
	</div>

</body>
</html>
