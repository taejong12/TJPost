<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역 상세 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container mt-5 mb-5">
	    <div class="row">
	        <%@ include file="/WEB-INF/views/user/member/memberSidebar.jsp"%>
	        <div class="col-md-8 text-center">
	            <h4 class="mb-3">주문내역 상세보기</h4>
	            <c:choose>
	                <c:when test="${empty ordersDetailList}">
	                    <p class="text-muted">등록된 주문상세내역이 없습니다.</p>
	                </c:when>
	                <c:otherwise>
	                    <div class="d-flex">
	                        <!-- 테이블 -->
	                        <div class="flex-grow-1">
	                            <table class="table table-bordered text-center align-middle">
	                                <thead class="table-dark">
	                                    <tr>
	                                        <th>이미지</th>
	                                        <th>상품명</th>
	                                        <th>결제 개수</th>
	                                        <th>결제 금액</th>
	                                        <th>주문 상태</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <c:forEach var="ordersDetail" items="${ordersDetailList}">
	                                        <tr>
	                                            <!-- 이미지 -->
	                                            <td class="align-middle">
	                                                <c:if test="${not empty fileList}">
	                                                    <c:set var="imagePrinted" value="false"/>
	                                                    <c:forEach var="file" items="${fileList}">
	                                                        <c:if test="${file.productId == ordersDetail.productId && !imagePrinted}">
	                                                            <img src="/img/product/${file.fileName}" 
	                                                                 alt="상품 이미지" 
	                                                                 class="img-fluid rounded" style="max-width: 60px; height: auto;">
	                                                            <c:set var="imagePrinted" value="true"/>
	                                                        </c:if>
	                                                    </c:forEach>
	                                                </c:if>
	                                            </td>
	                                            <td>${ordersDetail.ordersDetailProductName}</td>
	                                            <td>${ordersDetail.ordersDetailProductCount} 개</td>
	                                            <td>${ordersDetail.ordersDetailProductPayPrice} 원</td>
	                                            <td>${ordersDetail.ordersDetailStatus}</td>
	                                        </tr>
	                                    </c:forEach>
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <!-- 버튼 목록 -->
	                        <div>
	                            <ul class="list-unstyled ms-3">
	                                <c:forEach var="ordersDetail" items="${ordersDetailList}">
	                                    <li class="mb-2">
	                                        <button class="btn btn-danger btn-sm fw-bold ordersReturn">교환 신청</button>
	                                    </li>
	                                    <li class="mb-2">
	                                        <c:choose>
	                                            <c:when test="${empty ordersDetail.reviewId}">
	                                                <a class="btn btn-outline-success btn-sm fw-bold" href="/review/insert/${ordersDetail.ordersDetailId}">구매후기작성</a>
	                                            </c:when>
	                                            <c:otherwise>
	                                                <a class="btn btn-outline-dark btn-sm fw-bold" href="/review/detail/${ordersDetail.reviewId}">구매후기보기</a>
	                                            </c:otherwise>
	                                        </c:choose>
	                                    </li>
	                                </c:forEach>
	                            </ul>
	                        </div>
	                    </div>
	                </c:otherwise>
	            </c:choose>
	        </div>
	    </div>
	</div>


</body>
</html>