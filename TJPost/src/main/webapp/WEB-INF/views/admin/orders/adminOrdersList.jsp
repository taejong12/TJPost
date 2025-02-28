<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문내역 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center">공지사항</h2>

		<!-- 정렬 옵션 & 상품 개수 선택을 가로 정렬 -->
		<div class="d-flex align-items-center gap-3 mb-3 justify-content-end">
		    <!-- 상품 개수 선택 -->
		    <form id="limitForm" action="/admin/orders/listPaging" method="get">
		        <select name="limit" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('limitForm').submit();">
		            <option value="3" ${limit == 3 ? 'selected' : ''}>3개</option>
		            <option value="6" ${limit == 6 ? 'selected' : ''}>6개</option>
		            <option value="10" ${limit == 10 ? 'selected' : ''}>10개</option>
		        </select>
		    </form>
		</div>

		<table id="ordersTable" class="table table-bordered">
			<tr>
				<td id="ordersId">주문번호</td>
				<td id="memberId">회원아이디</td>
				<td id="ordersPaymentMethod">결제수단</td>
				<td id="ordersTotalCount">주문총수량</td>
				<td id="ordersTotalPrice">주문총금액</td>
				<td id="ordersStatus">주문상태</td>
				<td id="ordersCreate">주문생성</td>
				<td id="ordersUpdate">주문수정</td>
			</tr>
			<c:choose>
				<c:when test="${empty adminOrdersList}">
					<tr>
						<td colspan="8">등록된 주문내역이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="adminOrders" items="${adminOrdersList}">
						<tr>
						    <!-- 주문번호: 상세페이지 링크 -->
						    <td>
						        <a href="/admin/orders/detail/${adminOrders.ordersId}" class="text-decoration-none fw-bold text-primary">
						            #${adminOrders.ordersId}
						        </a>
						    </td>
						    
						    <!-- 회원 ID -->
						    <td>${adminOrders.memberId}</td>
						
						    <!-- 결제 방법 -->
						    <td>${adminOrders.ordersPaymentMethod}</td>
						
						    <!-- 총 상품 수량 -->
						    <td class="text-center">${adminOrders.ordersTotalCount}</td>
						
						    <!-- 총 결제 금액 (₩ 표시 추가) -->
						    <td class="text-end fw-bold text-danger">₩${adminOrders.ordersTotalPrice}</td>
						
						    <!-- 주문 상태 -->
						    <td class="text-center">
						        <c:choose>
						            <c:when test="${adminOrders.ordersStatus == '환불진행중'}">
						                <button class="btn btn-danger btn-sm fw-bold px-3" id="ordersReturn" data-orders-id="${adminOrders.ordersId}">환불승인</button>
						            </c:when>
						            <c:when test="${adminOrders.ordersStatus == '환불완료'}">
						                <span class="badge bg-success fw-bold px-3 py-2 fs-6 rounded">
						                    ✅ 환불완료
						                </span>
						            </c:when>
						            <c:otherwise>
						                <span class="badge bg-secondary px-3 py-2 fs-6"> ${adminOrders.ordersStatus} </span>
						            </c:otherwise>
						        </c:choose>
						    </td>
						
						    <!-- 주문 생성일 -->
						    <td class="text-center">${adminOrders.ordersCreate}</td>
						
						    <!-- 주문 수정일 -->
						    <td class="text-center">${adminOrders.ordersUpdate}</td>
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
		                    <a class="page-link" href="/admin/orders/listPaging?page=1&limit=${limit}">&laquo;&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
		             <!-- 이전 페이지 그룹 이동 버튼 -->
		            <c:if test="${startPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/orders/listPaging?page=${startPage - pageBlock}&limit=${limit}">&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
					<!-- 이전 페이지 버튼 -->
					<c:if test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="/admin/orders/listPaging?page=${currentPage - 1}&limit=${limit}">&laquo;</a>
						</li>
					</c:if>

					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/admin/orders/listPaging?page=${i}&limit=${limit}">${i}</a>
						</li>
					</c:forEach>

					<!-- 다음 페이지 버튼 -->
					<c:if test="${currentPage < totalPage}">
						<li class="page-item">
							<a class="page-link" href="/admin/orders/listPaging?page=${currentPage + 1}&limit=${limit}">&raquo;</a>
						</li>
					</c:if>
					
					<!-- 다음 페이지 그룹 이동 버튼 -->
		            <c:if test="${endPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/orders/listPaging?page=${startPage + pageBlock}&limit=${limit}">&raquo;&raquo;</a>
		                </li>
		            </c:if>
					
					<!-- 맨 마지막 페이지 이동 버튼 -->
		            <c:if test="${currentPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/orders/listPaging?page=${totalPage}&limit=${limit}">&raquo;&raquo;&raquo;</a>
		                </li>
		            </c:if>
				</ul>
			</nav>
		</div>
	</div>
	
	<script type="text/javascript">
	
		document.addEventListener("DOMContentLoaded", function (){
			
			if(document.querySelector("#ordersReturn")) {
				document.querySelector("#ordersReturn").addEventListener("click", function () {
					let ordersId = this.dataset.ordersId;
				
					let csrf = document.querySelector('meta[name="_csrf"]').content;
					let csrf_header = document.querySelector('meta[name="_csrf_header"]').content;
					
					fetch("/admin/orders/return",{
		            	method: "POST",
		            	headers: { "Content-Type": "application/json",
		            		[csrf_header]: csrf
		            	},
		            	body: JSON.stringify(ordersId)
		            })
		            .then(response => response.text())
		            .then(text => 
			            {alert(text), location.reload()}
		            )
		            .catch(error => {
		                console.error("에러 발생:", error);
		                alert("환불 중 오류가 발생했습니다.");
		            });
				});
			}
		});
	
	</script>
</body>
</html>