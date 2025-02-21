<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 등록 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>

	<div class="container mt-5 p-4 bg-light rounded shadow">
		<h2 class="text-center mb-4 text-primary">상품 등록</h2>

		<form action="/admin/product/insert" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="form-group mb-3">
				<label for="productName" class="form-label fw-bold">상품이름</label> 
				<input type="text" class="form-control form-control-lg" id="productName" name="productName" placeholder="상품이름을 입력하세요" required>
			</div>
			<div class="form-group mb-3">
				<label for="productPrice" class="form-label fw-bold">상품가격</label>
				<input type="text" class="form-control form-control-lg" id="productPrice" name="productPrice"  placeholder="상품가격을 입력하세요" required>
			</div>
			<div class="form-group mb-3">
				<label for="productContent" class="form-label fw-bold">상품내용</label>
				<input type="text" class="form-control form-control-lg" id="productContent" name="productContent"  placeholder="상품내용을 입력하세요" required>
			</div>
			<div class="form-group mb-3">
				<label for="productStock" class="form-label fw-bold">상품재고</label>
				<input type="text" class="form-control form-control-lg" id="productStock" name="productStock"  placeholder="상품재고를 입력하세요" required>
			</div>
			<div class="form-group mb-3">
				<label for="productCategory" class="form-label fw-bold">상품종류</label>
				<input type="text" class="form-control form-control-lg" id="productCategory" name="productCategory"  placeholder="상품종류를 입력하세요" required>
			</div>
			<div class="form-group mb-4">
				<label for="productFiles" class="form-label fw-bold">상품파일</label> 
				<input type="file" class="form-control form-control-lg" id="productFiles" name="productFiles" multiple>
			</div>
			<div class="d-grid">
				<button type="submit" class="btn btn-primary btn-lg">상품 등록</button>
			</div>
		</form>
	</div>
	
</body>
</html>