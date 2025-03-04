<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container mt-5">
        <div class="row">
            <!-- 상품 이미지 (왼쪽) -->
            <div class="col-md-8 text-center border-end d-flex flex-column align-items-center">
				<h4 class="mb-3">상품 이미지</h4>
                <c:choose>
                    <c:when test="${empty fileList}">
                        <p class="text-muted">등록된 이미지가 없습니다.</p>
                    </c:when>
                    <c:otherwise>
                        <div class="d-flex flex-column">
                            <c:forEach var="file" items="${fileList}">
                                <c:if test="${file.reviewId == reviewDTO.reviewId}">
                                    <img src="/img/review/${file.fileName}" class="img-fluid mb-2 w-75">
                                </c:if>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 상품 정보 (오른쪽 카드) -->
            <div class="col-md-4 d-flex justify-content-end">
                <div class="card p-4 shadow w-100">
                    <h4 class="mb-3">구매후기</h4>                    
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><strong>📌 제목:</strong> ${reviewDTO.reviewTitle}</li>
						<li class="list-group-item"><strong>💰 내용:</strong> ${reviewDTO.reviewContent}</li>
						<li class="list-group-item"><strong>📦 점수:</strong> ${reviewDTO.reviewScore}</li>
						<li class="list-group-item"><strong>🔖 작성일:</strong> ${reviewDTO.reviewCreate}</li>
						<li class="list-group-item"><strong>🔖 작성자:</strong> ${reviewDTO.memberId}</li>
						<li class="list-group-item"><strong>🔖 주문번호:</strong> ${reviewDTO.ordersDetailId}</li>
					</ul>
					
					<div class="d-flex justify-content-center mt-2">
						<a href="/review/listPaging" class="btn btn-info w-75">구매후기 목록</a>
					</div>
                </div>
            </div>
        </div>
	</div>
	
</body>
</html>