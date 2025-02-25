<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리 목록 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	<div class="container mt-5 mb-5">
		<div class="row">
			<%@ include file="/WEB-INF/views/user/member/memberSidebar.jsp"%>
				
			<!-- 본문 내용 -->
            <div class="col-md-9">
                <div class="d-flex align-items-center gap-3 mb-3 justify-content-end">
                    <!-- 상품 개수 선택 -->
                    <form id="limitForm" action="/address/listPaging" method="get">
                        <select name="limit" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('limitForm').submit();">
                            <option value="3" ${limit == 3 ? 'selected' : ''}>3개</option>
                            <option value="6" ${limit == 6 ? 'selected' : ''}>6개</option>
                            <option value="10" ${limit == 10 ? 'selected' : ''}>10개</option>
                        </select>
                    </form>
                </div>

                 <!-- 배송지 목록 (리스트 형식) -->
                <div class="list-group">
                    <c:choose>
                        <c:when test="${empty addressList}">
                            <div class="text-center">
                                <p>등록된 배송지가 없습니다.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="address" items="${addressList}">
                                <a href="/address/detail/${address.addressId}" class="list-group-item list-group-item-action">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h5 class="mb-1">이름: ${address.addressName}</h5>
                                            <p class="mb-1">우편번호: ${address.addressPostCode}</p>
                                            <p class="mb-1">도로명주소: ${address.addressRoadAddress}</p>
                                            <p class="mb-1">기본주소등록: ${address.addressDefaultAddress}</p>
                                        </div>
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
				                    <a class="page-link" href="/address/listPaging?page=1&limit=${limit}">&laquo;&laquo;&laquo;</a>
				                </li>
				            </c:if>
				            
				             <!-- 이전 페이지 그룹 이동 버튼 -->
				            <c:if test="${startPage > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="/address/listPaging?page=${startPage - pageBlock}&limit=${limit}">&laquo;&laquo;</a>
				                </li>
				            </c:if>
				            
							<!-- 이전 페이지 버튼 -->
							<c:if test="${currentPage > 1}">
								<li class="page-item">
									<a class="page-link" href="/address/listPaging?page=${currentPage - 1}&limit=${limit}">&laquo;</a>
								</li>
							</c:if>
		
							<!-- 페이지 번호 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<a class="page-link" href="/address/listPaging?page=${i}&limit=${limit}">${i}</a>
								</li>
							</c:forEach>
		
							<!-- 다음 페이지 버튼 -->
							<c:if test="${currentPage < totalPage}">
								<li class="page-item">
									<a class="page-link" href="/address/listPaging?page=${currentPage + 1}&limit=${limit}">&raquo;</a>
								</li>
							</c:if>
							
							<!-- 다음 페이지 그룹 이동 버튼 -->
				            <c:if test="${endPage < totalPage}">
				                <li class="page-item">
				                    <a class="page-link" href="/address/listPaging?page=${startPage + pageBlock}&limit=${limit}">&raquo;&raquo;</a>
				                </li>
				            </c:if>
							
							<!-- 맨 마지막 페이지 이동 버튼 -->
				            <c:if test="${currentPage < totalPage}">
				                <li class="page-item">
				                    <a class="page-link" href="/address/listPaging?page=${totalPage}&limit=${limit}">&raquo;&raquo;&raquo;</a>
				                </li>
				            </c:if>
						</ul>
					</nav>
				</div>

				<div class="d-grid mb-3 text-center">
					<a href="/address/insert" class="btn btn-outline-primary btn-sm-lg w-100">배송지 추가</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>