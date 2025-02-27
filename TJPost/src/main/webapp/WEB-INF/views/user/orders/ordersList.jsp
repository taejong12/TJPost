<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역 목록페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container mt-5 mb-5">
		<div class="row">
			<%@ include file="/WEB-INF/views/user/member/memberSidebar.jsp"%>
			<!-- 본문 내용 -->
            <div class="col-md-9">
				<h2 class="text-center mb-4 text-primary">📦 주문내역</h2>
                <div class="d-flex align-items-center gap-3 mb-3 justify-content-end">
                    <!-- 상품 개수 선택 -->
                    <form id="limitForm" action="/orders/listPaging" method="get">
                        <select name="limit" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('limitForm').submit();">
                            <option value="3" ${limit == 3 ? 'selected' : ''}>3개</option>
                            <option value="6" ${limit == 6 ? 'selected' : ''}>6개</option>
                            <option value="10" ${limit == 10 ? 'selected' : ''}>10개</option>
                        </select>
                    </form>
                </div>

                <!-- 주문내역  -->
                <div class="list-group">
			        <c:choose>
			            <c:when test="${empty ordersList}">
			                <div class="text-center">
			                    <p class="text-muted">📌 등록된 주문내역이 없습니다.</p>
			                </div>
			            </c:when>
			            <c:otherwise>
			                <c:forEach var="orders" items="${ordersList}">
			                    <a href="/orders/detail/${orders.ordersId}" class="list-group-item list-group-item-action shadow-sm rounded mb-3 p-4">
			                        <div class="d-flex justify-content-between align-items-center">
			                            <div>
			                                <h5 class="fw-bold text-dark"># 주문번호: ${orders.ordersId}</h5>
			                                <p class="mb-1 text-danger fw-bold">💰 주문금액: ₩${orders.ordersTotalPrice}</p>
			                                <p class="mb-1 text-muted">📆 주문일: ${orders.ordersCreate}</p>
			                            </div>
			                            <span class="badge">${orders.ordersStatus}</span>
			                        </div>
			                    </a>
			                </c:forEach>
			            </c:otherwise>
			        </c:choose>
			    </div>

				<!-- 페이징 -->
				<div class="d-flex justify-content-center m-3">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<!-- 맨 처음 페이지 이동 버튼 -->
				            <c:if test="${currentPage > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="/orders/listPaging?page=1&limit=${limit}">&laquo;&laquo;&laquo;</a>
				                </li>
				            </c:if>
				            
				             <!-- 이전 페이지 그룹 이동 버튼 -->
				            <c:if test="${startPage > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="/orders/listPaging?page=${startPage - pageBlock}&limit=${limit}">&laquo;&laquo;</a>
				                </li>
				            </c:if>
				            
							<!-- 이전 페이지 버튼 -->
							<c:if test="${currentPage > 1}">
								<li class="page-item">
									<a class="page-link" href="/orders/listPaging?page=${currentPage - 1}&limit=${limit}">&laquo;</a>
								</li>
							</c:if>
		
							<!-- 페이지 번호 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<a class="page-link" href="/orders/listPaging?page=${i}&limit=${limit}">${i}</a>
								</li>
							</c:forEach>
		
							<!-- 다음 페이지 버튼 -->
							<c:if test="${currentPage < totalPage}">
								<li class="page-item">
									<a class="page-link" href="/orders/listPaging?page=${currentPage + 1}&limit=${limit}">&raquo;</a>
								</li>
							</c:if>
							
							<!-- 다음 페이지 그룹 이동 버튼 -->
				            <c:if test="${endPage < totalPage}">
				                <li class="page-item">
				                    <a class="page-link" href="/orders/listPaging?page=${startPage + pageBlock}&limit=${limit}">&raquo;&raquo;</a>
				                </li>
				            </c:if>
							
							<!-- 맨 마지막 페이지 이동 버튼 -->
				            <c:if test="${currentPage < totalPage}">
				                <li class="page-item">
				                    <a class="page-link" href="/orders/listPaging?page=${totalPage}&limit=${limit}">&raquo;&raquo;&raquo;</a>
				                </li>
				            </c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
</html>