<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container mt-5 mb-5">
		<h2 class="text-center mb-4">📌 상품 상세 정보</h2>
		<div class="card shadow p-4">
			<div class="row">
				<!-- 상품 이미지 -->
				<div class="col-md-6 text-center">
					<h4 class="mb-3">상품 이미지</h4>
					<c:choose>
						<c:when test="${empty fileList}">
							<p class="text-muted">등록된 이미지가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<div class="d-flex flex-wrap justify-content-center">
								<c:forEach var="file" items="${fileList}">
									<c:if test="${file.productId == productDTO.productId}">
										<div class="m-2">
											<img src="/img/product/${file.fileName}" class="product-img">
										</div>
									</c:if>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- 상품 정보 -->
				<div class="col-md-6">
					<h4 class="mb-3">상품 정보</h4>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><strong>📌 상품명:</strong> ${productDTO.productName}</li>
						<li class="list-group-item"><strong>💰 가격:</strong> ${productDTO.productPrice} 원</li>
						<li class="list-group-item"><strong>📝 설명:</strong> ${productDTO.productContent}</li>
						<li class="list-group-item"><strong>📦 재고:</strong> ${productDTO.productStock} 개</li>
						<li class="list-group-item"><strong>🔖 카테고리:</strong> ${productDTO.productCategory}</li>
						<li class="list-group-item"><a href="/product/pay/${productDTO.productId}" class="btn btn-success">결제하기</a></li>
						<li class="list-group-item"><a href="/product/cart/${productDTO.productId}" class="btn btn-info">장바구니</a></li>
						<li class="list-group-item"><strong>🔖 상품후기</strong></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 버튼 -->
		<div class="text-center mt-4">
			<div class="d-flex justify-content-center gap-2">
				<a href="/product/listPaging" class="btn btn-primary">상품 목록</a>
			</div>
		</div>
	</div>
</body>
</html>