<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제완료 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container d-flex justify-content-center align-items-center mt-5 mb-5">
	    <div class="card p-5 shadow-lg text-center" style="max-width: 500px; width: 100%;">
	        <h2 class="text-primary mb-4">✅ 결제 완료!</h2>
	        
	        <!-- 주문 정보 -->
	        <div class="mb-3">
	            <h5 class="fw-bold">주문번호</h5>
	            <p class="text-muted">${ordersDTO.ordersId}</p>
	        </div>
	
	        <div class="mb-3">
	            <h5 class="fw-bold">결제금액</h5>
	            <p class="fs-4 fw-bold text-danger">${ordersDTO.ordersTotalPrice}</p>
	        </div>
	
	        <div class="mb-3">
	            <h5 class="fw-bold">결제수단</h5>
	            <p class="text-muted">${ordersDTO.ordersPaymentMethod}</p>
	        </div>
	
	        <!-- 버튼 -->
	        <div class="d-grid gap-2">
	            <a href="/orders/listPaging" class="btn btn-primary btn-lg">🛒 주문내역 보기</a>
	            <a href="/" class="btn btn-outline-secondary btn-lg">🏠 메인으로 가기</a>
	        </div>
	    </div>
	</div>


</body>
</html>