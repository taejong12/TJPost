<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문상세페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>
	
	<div class="container mt-5">
    <h2 class="text-center mb-4 fw-bold">관리자 주문 상세 페이지</h2>

    <div class="table-responsive">
        <table id="ordersDetailTable" class="table table-striped table-hover text-center align-middle">
            <thead class="table-dark">
                <tr>
                    <th>주문번호</th>
                    <th>주문상세번호</th>
                    <th>배달번호</th>
                    <th>상품번호</th>
                    <th>상품이름</th>
                    <th>상품가격</th>
                    <th>구매수량</th>
                    <th>총 결제금액</th>
                    <th>주문 상태</th>
                    <th>생성일</th>
                    <th>수정일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty adminOrdersDetailList}">
                        <tr>
                            <td colspan="11" class="text-muted fw-bold py-4">📌 등록된 주문 상세 내역이 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="adminOrdersDetail" items="${adminOrdersDetailList}">
                            <tr>
                                <td class="fw-bold">${adminOrdersDetail.ordersId}</td>
                                <td>${adminOrdersDetail.ordersDetailId}</td>
                                <td>${adminOrdersDetail.deliveryId}</td>
                                <td>${adminOrdersDetail.productId}</td>
                                <td class="text-primary">${adminOrdersDetail.ordersDetailProductName}</td>
                                <td>₩${adminOrdersDetail.ordersDetailProductPrice}</td>
                                <td>${adminOrdersDetail.ordersDetailProductCount}</td>
                                <td class="text-danger fw-bold">₩${adminOrdersDetail.ordersDetailProductPayPrice}</td>
                                <td>
								    <c:choose>
								        <c:when test="${adminOrdersDetail.ordersDetailStatus == '환불진행중'}">
								        	<span class="badge bg-info text-dark">환불진행중</span>
								        </c:when>
								        <c:when test="${adminOrdersDetail.ordersDetailStatus == '교환대기'}">
								            <button class="btn btn-warning btn-sm text-dark">교환신청</button>
								        </c:when>
								        <c:when test="${adminOrdersDetail.ordersDetailStatus == '교환진행중'}">
								            <span class="badge bg-info text-dark">교환진행중</span>
								        </c:when>
								        <c:when test="${adminOrdersDetail.ordersDetailStatus == '배송준비'}">
								            <span class="badge bg-secondary">배송준비</span>
								        </c:when>
								        <c:when test="${adminOrdersDetail.ordersDetailStatus == '배송중'}">
								            <span class="badge bg-primary">배송중</span>
								        </c:when>
								        <c:when test="${adminOrdersDetail.ordersDetailStatus == '배송완료'}">
								            <span class="badge bg-success">배송완료</span>
								        </c:when>
								    </c:choose>
								</td>
                                <td>${adminOrdersDetail.ordersDetailCreate}</td>
                                <td>${adminOrdersDetail.ordersDetailUpdate}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-4">
        <a href="/admin/orders/listPaging" class="btn btn-primary px-4 py-2 fw-bold shadow-sm">
            📋 주문 내역 목록
        </a>
    </div>
</div>

<script>

</script>
</body>
</html>