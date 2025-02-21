<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 목록 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center">상품</h2>
		
		<!-- 정렬 옵션 & 상품 개수 선택을 가로 정렬 -->
		<div class="d-flex align-items-center gap-3 mb-3 justify-content-end">
		    <!-- 정렬 옵션 드롭다운 -->
		    <form id="sortForm" action="/admin/product/list" method="get">
		        <select name="sort" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('sortForm').submit();">
		            <option value="latest" ${sort == 'latest' ? 'selected' : ''}>최신순</option>
		            <option value="sales" ${sort == 'sales' ? 'selected' : ''}>판매량순</option>
		            <option value="highPrice" ${sort == 'highPrice' ? 'selected' : ''}>높은가격순</option>
		            <option value="lowPrice" ${sort == 'lowPrice' ? 'selected' : ''}>낮은가격순</option>
		        </select>
		    </form>
		
		    <!-- 상품 개수 선택 -->
		    <form id="limitForm" action="/admin/product/list" method="get">
		        <input type="hidden" name="sort" value="${sort}">
		        <select name="limit" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('limitForm').submit();">
		            <option value="3" ${limit == 3 ? 'selected' : ''}>3개</option>
		            <option value="6" ${limit == 6 ? 'selected' : ''}>6개</option>
		            <option value="10" ${limit == 10 ? 'selected' : ''}>10개</option>
		        </select>
		    </form>
		</div>

		<table id="productTable" class="table table-bordered">
			<tr>
				<td id="productId">상품번호</td>
				<td id="productName">상품이름</td>
				<td id="productPrice">상품가격</td>
				<td id="productStock">상품재고</td>
				<td id="productCategory">상품종류</td>
				<td id="productCreate">상품생성일</td>
				<td id="memberId">상품등록아이디</td>
			</tr>
			<c:choose>
				<c:when test="${empty adminProductList}">
					<tr>
						<td colspan="7">등록된 상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="adminProduct" items="${adminProductList}">
						<tr>
							<td>${adminProduct.productId}</td>
							<td><a
								href="/admin/product/detail/${adminProduct.productId}">${adminProduct.productName}</a>
							</td>
							<td>${adminProduct.productPrice}</td>
							<td>${adminProduct.productStock}</td>
							<td>${adminProduct.productCategory}</td>
							<td>${adminProduct.productCreate}</td>
							<td>${adminProduct.memberId}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<!-- 페이징 -->
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
				
					 <!-- 맨 처음 페이지 이동 버튼 -->
		            <c:if test="${currentPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/product/list?page=1&limit=${limit}&sort=${sort}">&laquo;&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
		             <!-- 이전 페이지 그룹 이동 버튼 -->
		            <c:if test="${startPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/product/list?page=${startPage - pageBlock}&limit=${limit}&sort=${sort}">&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
					<!-- 이전 페이지 버튼 -->
					<c:if test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="/admin/product/list?page=${currentPage - 1}&limit=${limit}&sort=${sort}">&laquo;</a>
						</li>
					</c:if>

					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/admin/product/list?page=${i}&limit=${limit}&sort=${sort}">${i}</a>
						</li>
					</c:forEach>

					<!-- 다음 페이지 버튼 -->
					<c:if test="${currentPage < totalPage}">
						<li class="page-item">
							<a class="page-link" href="/admin/product/list?page=${currentPage + 1}&limit=${limit}&sort=${sort}">&raquo;</a>
						</li>
					</c:if>
					
					<!-- 다음 페이지 그룹 이동 버튼 -->
		            <c:if test="${endPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/product/list?page=${startPage + pageBlock}&limit=${limit}&sort=${sort}">&raquo;&raquo;</a>
		                </li>
		            </c:if>
					
					<!-- 맨 마지막 페이지 이동 버튼 -->
		            <c:if test="${currentPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/product/list?page=${totalPage}&limit=${limit}">&raquo;&raquo;&raquo;</a>
		                </li>
		            </c:if>
				</ul>
			</nav>
		</div>

		<a href="/admin/product/insert" class="btn btn-primary mb-3">상품 등록</a>
	</div>

	<script>
		
	</script>
</body>
</html>