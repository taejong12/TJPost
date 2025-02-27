<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	<div class="container mt-5">
		<h2 class="text-center">상품</h2>

		<!-- 정렬 옵션 & 상품 개수 선택을 가로 정렬 -->
		<div class="d-flex align-items-center gap-3 mb-3 justify-content-end">
		    <!-- 정렬 옵션 드롭다운 -->
		    <form id="sortForm" action="/product/listPaging" method="get">
		        <select name="sort" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('sortForm').submit();">
		            <option value="latest" ${sort == 'latest' ? 'selected' : ''}>최신순</option>
		            <option value="sales" ${sort == 'sales' ? 'selected' : ''}>판매량순</option>
		            <option value="highPrice" ${sort == 'highPrice' ? 'selected' : ''}>높은가격순</option>
		            <option value="lowPrice" ${sort == 'lowPrice' ? 'selected' : ''}>낮은가격순</option>
		        </select>
		    </form>
		
		    <!-- 상품 개수 선택 -->
		    <form id="limitForm" action="/product/listPaging" method="get">
		        <input type="hidden" name="sort" value="${sort}">
		        <select name="limit" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('limitForm').submit();">
		            <option value="3" ${limit == 3 ? 'selected' : ''}>3개</option>
		            <option value="6" ${limit == 6 ? 'selected' : ''}>6개</option>
		            <option value="10" ${limit == 10 ? 'selected' : ''}>10개</option>
		        </select>
		    </form>
		</div>

		<!-- 상품 목록 (그리드 형식) -->
		<div class="row">
			<c:choose>
				<c:when test="${empty productList}">
					<div class="col-12 text-center">
						<p>등록된 상품이 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="product" items="${productList}">
						<div class="col-md-4 mb-4">
							<a href="/product/detail/${product.productId}" class="text-decoration-none text-dark">
								<div class="card h-100 shadow-sm">
									<div class="carousel slide" data-bs-ride="carousel">
	                                    <div class="carousel-inner">
	                                    	<c:set var="isFirst" value="true"/>
	                                        <c:forEach var="productFile" items="${productFileList}">
	                                            <c:if test="${productFile.productId == product.productId}">
	                                                <div class="carousel-item ${isFirst ? 'active' : ''}">
	                                                    <img src="/img/product/${productFile.fileName}" alt="상품 이미지" class="card-img-top d-block w-100" style="height: 200px;">
	                                                </div>
	                                                <c:set var="isFirst" value="false"/>
	                                            </c:if>
	                                        </c:forEach>
	                                    </div>
	                                </div>
									<div class="card-body">
										<h5 class="card-title">${product.productName}</h5>
										<p class="card-text">가격: ${product.productPrice}원</p>
										<p class="card-text text-muted">재고: ${product.productStock}</p>
										<p class="card-text"><small class="text-muted">${product.productCategory}</small></p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- 페이징 -->
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
				
					 <!-- 맨 처음 페이지 이동 버튼 -->
		            <c:if test="${currentPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/product/listPaging?page=1&limit=${limit}&sort=${sort}">&laquo;&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
		             <!-- 이전 페이지 그룹 이동 버튼 -->
		            <c:if test="${startPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/product/listPaging?page=${startPage - pageBlock}&limit=${limit}&sort=${sort}">&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
					<!-- 이전 페이지 버튼 -->
					<c:if test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="/product/listPaging?page=${currentPage - 1}&limit=${limit}&sort=${sort}">&laquo;</a>
						</li>
					</c:if>

					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/product/listPaging?page=${i}&limit=${limit}&sort=${sort}">${i}</a>
						</li>
					</c:forEach>

					<!-- 다음 페이지 버튼 -->
					<c:if test="${currentPage < totalPage}">
						<li class="page-item">
							<a class="page-link" href="/product/listPaging?page=${currentPage + 1}&limit=${limit}&sort=${sort}">&raquo;</a>
						</li>
					</c:if>
					
					<!-- 다음 페이지 그룹 이동 버튼 -->
		            <c:if test="${endPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/product/listPaging?page=${startPage + pageBlock}&limit=${limit}&sort=${sort}">&raquo;&raquo;</a>
		                </li>
		            </c:if>
					
					<!-- 맨 마지막 페이지 이동 버튼 -->
		            <c:if test="${currentPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/product/listPaging?page=${totalPage}&limit=${limit}&sort=${sort}">&raquo;&raquo;&raquo;</a>
		                </li>
		            </c:if>
				</ul>
			</nav>
		</div>
	</div>
	
</body>
</html>