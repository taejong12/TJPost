<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매후기 목록페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container mt-5">
		<h2 class="text-center">구매후기</h2>

		<!-- 정렬 옵션 & 상품 개수 선택을 가로 정렬 -->
		<div class="d-flex align-items-center gap-3 mb-3 justify-content-end">
		    <!-- 정렬 옵션 드롭다운 -->
		    <form id="sortForm" action="/review/listPaging" method="get">
		        <select name="sort" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('sortForm').submit();">
		            <option value="latest" ${sort == 'latest' ? 'selected' : ''}>최신순</option>
		            <%-- <option value="latest" ${sort == 'latest' ? 'selected' : ''}>점수순</option> --%>
		        </select>
		    </form>
		
		    <!-- 상품 개수 선택 -->
		    <form id="limitForm" action="/review/listPaging" method="get">
		        <input type="hidden" name="sort" value="${sort}">
		        <select name="limit" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('limitForm').submit();">
		            <option value="3" ${limit == 3 ? 'selected' : ''}>3개</option>
		            <option value="6" ${limit == 6 ? 'selected' : ''}>6개</option>
		            <option value="10" ${limit == 10 ? 'selected' : ''}>10개</option>
		        </select>
		    </form>
		</div>

		<!-- 구매후기 (그리드 형식) -->
		<div class="row">
			<c:choose>
				<c:when test="${empty reviewList}">
					<div class="col-12 text-center">
						<p>등록된 구매후기가 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="review" items="${reviewList}">
						<div class="col-md-4 mb-4">
							<a href="/review/detail/${review.reviewId}" class="text-decoration-none text-dark">
								<div class="card h-100 shadow-sm">
									<div class="carousel slide" data-bs-ride="carousel">
	                                    <div class="carousel-inner">
	                                    	<c:set var="isFirst" value="true"/>
	                                        <c:forEach var="file" items="${fileList}">
	                                            <c:if test="${file.reviewId == review.reviewId}">
	                                                <div class="carousel-item ${isFirst ? 'active' : ''}">
	                                                    <img src="/img/review/${file.fileName}" alt="구매후기 이미지" class="card-img-top d-block w-100" style="height: 200px;">
	                                                </div>
	                                                <c:set var="isFirst" value="false"/>
	                                            </c:if>
	                                        </c:forEach>
	                                    </div>
	                                </div>
									<div class="card-body">
										<h5 class="card-title">${review.reviewTitle}</h5>
										<p class="card-text">내용: ${review.reviewContent}</p>
										<p class="card-text text-muted">점수: ${review.reviewScore}</p>
										<p class="card-text">작성일: ${review.reviewCreate}</p>
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
		                    <a class="page-link" href="/review/listPaging?page=1&limit=${limit}">&laquo;&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
		             <!-- 이전 페이지 그룹 이동 버튼 -->
		            <c:if test="${startPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/review/listPaging?page=${startPage - pageBlock}&limit=${limit}">&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
					<!-- 이전 페이지 버튼 -->
					<c:if test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="/review/listPaging?page=${currentPage - 1}&limit=${limit}">&laquo;</a>
						</li>
					</c:if>

					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/review/listPaging?page=${i}&limit=${limit}">${i}</a>
						</li>
					</c:forEach>

					<!-- 다음 페이지 버튼 -->
					<c:if test="${currentPage < totalPage}">
						<li class="page-item">
							<a class="page-link" href="/review/listPaging?page=${currentPage + 1}&limit=${limit}">&raquo;</a>
						</li>
					</c:if>
					
					<!-- 다음 페이지 그룹 이동 버튼 -->
		            <c:if test="${endPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/review/listPaging?page=${startPage + pageBlock}&limit=${limit}">&raquo;&raquo;</a>
		                </li>
		            </c:if>
					
					<!-- 맨 마지막 페이지 이동 버튼 -->
		            <c:if test="${currentPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/review/listPaging?page=${totalPage}&limit=${limit}">&raquo;&raquo;&raquo;</a>
		                </li>
		            </c:if>
				</ul>
			</nav>
		</div>
	</div>
	
</body>
</html>