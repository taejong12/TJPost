<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 수정페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>
	
	<div class="container mt-5 mb-5">
		<h2 class="text-center mb-4">상품 수정하기</h2>
		<div class="card shadow p-4">
			<form action="/admin/product/update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="productId" value="${adminProductDTO.productId}">
				<div class="row mb-3">
					<div class="col-md-3">
						<label class="form-label">상품번호</label>
						<p class="form-control-plaintext border p-2 bg-light">${adminProductDTO.productId}</p>
					</div>
					<div class="col-md-3">
						<label class="form-label">상품등록아이디</label>
						<p class="form-control-plaintext border p-2 bg-light">${adminProductDTO.memberId}</p>
					</div>
					<div class="col-md-3">
						<label class="form-label">상품등록일</label>
						<p class="form-control-plaintext border p-2 bg-light">${adminProductDTO.productCreate}</p>
					</div>
					<div class="col-md-3">
						<label class="form-label">상품수정일</label>
						<p class="form-control-plaintext border p-2 bg-light">${adminProductDTO.productUpdate}</p>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-6">
						<label for="productName" class="form-label">상품이름</label>
						<input type="text" id="productName" name="productName" value="${adminProductDTO.productName}" class="form-control">
					</div>
					<div class="col-md-6">
						<label for="productPrice" class="form-label">상품가격</label>
						<input type="text" id="productPrice" name="productPrice" value="${adminProductDTO.productPrice}" class="form-control">
					</div>
				</div>
				<div class="mb-3">
					<label for="productContent" class="form-label">상품내용</label>
					<textarea id="productContent" name="productContent" class="form-control" rows="3">${adminProductDTO.productContent}</textarea>
				</div>
				<div class="mb-3">
					<label for="productStock" class="form-label">상품재고</label>
					<input type="text" id="productStock" name="productStock" value="${adminProductDTO.productStock}" class="form-control">
				</div>
				<div class="mb-3">
					<label for="productCategory" class="form-label">상품종류</label>
					<input type="text" id="productCategory" name="productCategory" value="${adminProductDTO.productCategory}" class="form-control">
				</div>
				<div class="mb-3">
					<label for="productFiles" class="form-label">상품파일</label>
					<input type="file" id="productFiles" name="productFiles" class="form-control" multiple>
					<c:choose>
						<c:when test="${empty fileList}">
							<p class="text-muted">등록된 파일이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<ul class="list-group mt-2">
								<c:forEach var="file" items="${fileList}">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span>${file.fileOriginalName}</span>
									</li>
								</c:forEach>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="text-center mt-4">
					<button type="submit" class="btn btn-success">수정 완료</button>
					<a href="/admin/product/detail/${adminProductDTO.productId}" class="btn btn-secondary">취소</a>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>
