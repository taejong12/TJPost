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
				<h4 class="mb-3">주문내역상세보기</h4>
                <c:choose>
                    <c:when test="${empty ordersDetailList}">
                        <p class="text-muted">등록된 주문상세내역이 없습니다.</p>
                    </c:when>
                    <c:otherwise>
                    	<table class="table table-bordered text-center align-middle">
                    		<thead class="table-dark">
                         		<tr>
	                                <th>이미지</th>
	                                <th>상품명</th>
	                                <th>결제갯수</th>
	                                <th>결제금액</th>
	                                <th>주문상태</th>
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
								                             alt="상품이미지" 
								                             class="img-fluid rounded" 
								                             style="max-width: auto; height: auto;">
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
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>