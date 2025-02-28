<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
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
                                <c:if test="${file.productId == productDTO.productId}">
                                    <img src="/img/product/${file.fileName}" class="img-fluid mb-2 w-75">
                                </c:if>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 상품 정보 (오른쪽 카드) -->
            <div class="col-md-4 d-flex justify-content-end">
                <div class="card p-4 shadow w-100">
                    <h4 class="mb-3">상품 정보</h4>                    
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><strong>📌 상품명:</strong> ${productDTO.productName}</li>
						<li class="list-group-item"><strong>💰 가격:</strong> ${productDTO.productPrice} 원</li>
						<li class="list-group-item"><strong>📦 재고:</strong> ${productDTO.productStock} 개</li>
						<li class="list-group-item"><strong>🔖 카테고리:</strong> ${productDTO.productCategory}</li>
						<li class="list-group-item">
							<strong>🛒 총수량:</strong>
							<input type="number" id="totalCount" name="productPayTotalCount" value="1" min="1" max="${productDTO.productStock}" class="form-control w-50 d-inline">
						</li>
						<li class="list-group-item"><strong>💵 총결제금액:</strong> <span id="totalPrice">${productDTO.productPrice}</span> 원</li>
					</ul>
					<div class="d-flex justify-content-center mt-3">
						<button id="productListInfo" class="btn btn-outline-success w-75">💳 결제하기</button>
					</div>
					<div class="d-flex justify-content-center mt-2">
						<button id="insertCart" class="btn btn-info w-75">🛍️ 장바구니 담기</button>
					</div>
                </div>
            </div>
        </div>

        <!-- 후기 및 추가 정보 -->
        <div class="d-flex justify-content-center mt-4 mb-5 border">
            <button id="toggleDetails" class="btn btn-light w-100">더보기 ▼</button>
        </div>
        <div id="extraDetails" class="mt-3 mb-5 d-none">
            <div class="card p-3 text-center">
                <h5>상품 설명</h5>
                <p>${productDTO.productContent}</p>
                <h5>상품 후기</h5>
                <p>상품 후기는 여기에 표시됩니다.</p>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#totalCount').on('input', function() {
                let count = $(this).val();
                let price = ${productDTO.productPrice};
                $('#totalPrice').text(price * count);
            });

            $('#toggleDetails').click(function() {
                $('#extraDetails').toggleClass('d-none');
            });
            
            $('#insertCart').on('click', function() {
            	
            	let csrfToken = $("meta[name='_csrf']").attr("content");
            	let csrfHeader = $("meta[name='_csrf_header']").attr("content");
            	
            	if($('#totalCount').val() < 1){
            		alert("상품 수량이 1보다 작습니다.");
            		return;
            	}
            	
            	let cartDTO = {
          			cartProductName: "${productDTO.productName}",
      				cartProductPrice: ${productDTO.productPrice},
      				cartCount: $('#totalCount').val(),
      				cartTotalPrice: $('#totalPrice').text(),
      				productId: ${productDTO.productId}
            	}
            	
            	$.ajax({
            		type: "POST",
            		url: "/cart/insert",
            		contentType: "application/json",
            		data: JSON.stringify(cartDTO),
            		beforeSend: function(xhr) {
                        xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰 추가
                    },
            		success: function(response) {
            			if (confirm(response)) {
            	            window.location.href = "/cart/list";
            	        }
                    },
                    error: function() {
                        alert("장바구니 추가 중 오류가 발생했습니다.");
                    }
            	})
            });
            
            $('#productListInfo').on('click', function() {
            	let productList = [];
            	let count = $('#totalCount').val();
            	let price = $("#totalPrice").text();
            	
            	if(count < 1){
            		alert("상품 수량이 1보다 작습니다.");
            		return;
            	}
            	
            	productList.push({
					productId: ${productDTO.productId},
					productName: "${productDTO.productName}",
					productPrice: ${productDTO.productPrice},
					productPayTotalCount: count,
					productTotalPrice: price
				});
            	let csrf = document.querySelector('meta[name="_csrf"]').content;
				let csrf_header = document.querySelector('meta[name="_csrf_header"]').content;
				
	            fetch("/product/productListInfo",{
	            	method: "POST",
	            	headers: { "Content-Type": "application/json",
	            		[csrf_header]: csrf
	            	},
	            	body: JSON.stringify(productList)
	            })
	            .then(response => response.json())
	            .then(data => 
		            {window.location.href = data.redirectUrl}
	            )
	            .catch(error => {
	                console.error("에러 발생:", error);
	                alert("결제 페이지 이동 중 오류가 발생했습니다.");
	            });
            });
        });
    </script>
</body>
</html>