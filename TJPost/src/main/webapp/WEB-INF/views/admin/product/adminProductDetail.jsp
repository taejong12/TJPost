<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 상세 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>
	
	<div class="container mt-5">
        <h2 class="text-center mb-4">관리자 상품 상세페이지</h2>
        <div class="card shadow p-4">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="mb-3">상품 정보</h4>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><strong>상품번호:</strong> ${productDTO.productId}</li>
                        <li class="list-group-item"><strong>상품이름:</strong> ${productDTO.productName}</li>
                        <li class="list-group-item"><strong>상품가격:</strong> ${productDTO.productPrice} 원</li>
                        <li class="list-group-item"><strong>상품내용:</strong> ${productDTO.productContent}</li>
                        <li class="list-group-item"><strong>상품재고:</strong> ${productDTO.productStock} 개</li>
                        <li class="list-group-item"><strong>상품종류:</strong> ${productDTO.productCategory}</li>
                        <li class="list-group-item"><strong>상품생성일:</strong> ${productDTO.productCreate}</li>
                        <li class="list-group-item"><strong>상품수정일:</strong> ${productDTO.productUpdate}</li>
                        <li class="list-group-item"><strong>상품등록아이디:</strong> ${productDTO.memberId}</li>
                    </ul>
                </div>
                <div class="col-md-6 text-center">
                    <h4 class="mb-3">상품 이미지</h4>
                    <c:choose>
                        <c:when test="${empty fileList}">
                            <p class="text-muted">등록된 파일이 없습니다.</p>
                        </c:when>
                        <c:otherwise>
                            <div class="d-flex flex-wrap justify-content-center">
                                <c:forEach var="file" items="${fileList}">
                                	<c:if test="${file.productId == productDTO.productId}">
	                                    <div class="m-2">
											<img src="/img/product/${file.fileName}" width="100" class="rounded shadow">
											<p class="mt-2 small">${file.fileOriginalName}</p>
	                                    </div>
                                	</c:if>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="/admin/product/update/${productDTO.productId}" class="btn btn-primary mr-2">상품 수정</a>
            <a href="/admin/product/delete/${productDTO.productId}" class="btn btn-danger">상품 삭제</a>
        </div>
    </div>
	
</body>
</html>