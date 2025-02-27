<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container mt-5">
        <form action="/product/pay" method="post">
            <!-- 결제 상품 정보 -->
            <div class="card p-4 mb-3">
                <h4 class="mb-3">결제 상품 정보</h4>
                <table class="table table-bordered text-center align-middle">
				    <thead class="table-light">
				        <tr>
				            <th>선택</th>
				            <th>이미지</th>
				            <th>상품명</th>
				            <th>가격</th>
				            <th>수량</th>
				            <th>총 가격</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach var="product" items="${productList}">
				            <tr>
				                <!-- 체크박스 -->
				                <td class="align-middle">
				                    <input type="checkbox" checked>
				                    <input type="hidden" id="productId" name="productId" value="${product.productId}">
				                </td>
				
				                <!-- 이미지 -->
				                <td class="align-middle">
				                    <c:if test="${not empty fileList}">
				                        <img src="/img/product/${fileList[0].fileName}" 
				                             alt="상품이미지" 
				                             class="img-fluid rounded" 
				                             style="max-width: 100px; height: auto;">
				                    </c:if>
				                </td>
				
				                <!-- 상품명 -->
				                <td class="align-middle" id="productName">${product.productName}</td>
				
				                <!-- 가격 -->
				                <td class="align-middle fw-bold text-primary" id="productPrice">
				                    ${product.productPrice}원
				                </td>
				
				                <!-- 수량 입력 -->
				                <td class="align-middle">
				                    <input type="number" 
				                           id="count" 
				                           name="productPayTotalCount" 
				                           value="${product.productPayTotalCount}" 
				                           min="1" 
				                           max="${product.productStock}" 
				                           class="form-control w-50 mx-auto text-center">
				                	<input type="hidden" id="productStock" name="productStock" value="${product.productStock}">
				                </td>
				
				                <!-- 총 가격 -->
				                <td class="align-middle fw-bold text-danger" id="totalPrice">
				                    ${product.productPrice * product.productPayTotalCount}원
				                </td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
                <h5 class="text-end">총 결제 금액: <span id="finalTotalPrice"></span> 원</h5>
            </div>

            <!-- 배송지 정보 -->
            <div class="card p-4 mb-3">
                <h4 class="mb-3">배송지 정보</h4>
                <input type="hidden" id="addressId" name="addressId" value="${addressDTO.addressId}">
                <label>받는 사람:</label>
                <input type="text" id="addressName" name="addressName" class="form-control" value="${addressDTO.addressName}" required onclick="openAddressPopup()">
                <label>도로명주소:</label>
                <input type="text" id="addressRoadAddress" name="addressRoadAddress" class="form-control mt-2" value="${addressDTO.addressRoadAddress}" required readonly onclick="openAddressPopup()">
                <label>상세주소:</label>
                <input type="text" id="addressDetailAddress" name="addressDetailAddress" class="form-control mt-2" value="${addressDTO.addressDetailAddress}" required readonly onclick="openAddressPopup()">
                <label>우편번호:</label>
                <input type="text" id="addressPostCode" name="addressPostCode" class="form-control mt-2" value="${addressDTO.addressPostCode}" required readonly onclick="openAddressPopup()">
                <label>핸드폰번호:</label>
                <input type="tel" id="addressPhoneNumber" name="addressPhoneNumber" class="form-control mt-2" value="${addressDTO.addressPhoneNumber}" required readonly onclick="openAddressPopup()">
                <button type="button" class="btn btn-secondary mt-2" onclick="openAddressPopup()">배송지 목록</button>
            </div>

            <!-- 결제 수단 선택 -->
            <div class="card p-4 mb-3">
                <h4 class="mb-3">결제 수단 선택</h4>
                <select class="form-select" id="ordersPaymentMethod" name="ordersPaymentMethod" required>
                    <option value="신용카드">신용카드</option>
                    <option value="계좌이체">계좌이체</option>
                </select>
            </div>

            <!-- 결제 버튼 -->
            <div class="text-center mb-5">
                <button type="submit" class="btn btn-outline-success btn-lg w-50">결제하기</button>
            </div>
        </form>
    </div>

    <script>
	    document.addEventListener("DOMContentLoaded", function () {
	        function updateTotal() {
	        	let finalTotalPrice = 0;
	            let finalTotalCount = 0;

	            // 선택된 상품 정보를 담을 배열
	            let selectedProducts = [];
	            
	            // 모든 테이블 행을 순회하며 가격 계산
	            document.querySelectorAll("tbody tr").forEach((row) => {
	            	let checkbox = row.querySelector("input[type='checkbox']");
	                if (!checkbox.checked) return; // 체크되지 않은 행은 건너뛰기
	            	
	                let productName = row.querySelector("#productName").innerText.trim();
	                let price = parseInt(row.querySelector("#productPrice").innerText.replace("원", "").trim());
	                let countRow = row.querySelector("#count");
	                let totalPriceRow = row.querySelector("#totalPrice");
	                let productStock = parseInt(row.querySelector("#productStock").value);
	                let productId = parseInt(row.querySelector("#productId").value);
	              
	             	// 재고보다 많으면 재고 수량으로 변경
	                if(parseInt(countRow.value)>productStock){
	                	countRow.value = productStock;
	                }
	                
	                let count = parseInt(countRow.value);
	                
	             	// 입력값이 비어 있으면 0으로 설정
	                if (isNaN(count) || count === "" || count < 1) {
	                	count = 0;
	                }
	                
	                // 총 가격 계산
	                let totalPrice = price * count;
	                
	                totalPriceRow.innerText = totalPrice + "원";
	
	             	// 전체 결제 금액과 총 수량 합산
	                finalTotalPrice += totalPrice;
	                finalTotalCount += count;
	                
	                // 선택된 상품 리스트에 추가
	                selectedProducts.push({
	                	ordersDetailProductName: productName,
	                	ordersDetailProductPrice: price,
	                	ordersDetailProductCount: count,
	                	ordersDetailProductPayPrice: totalPrice,
	                	productId: productId,
	                	productStock: productStock
	                });
	             	
	            });
	
	            // 최종 결제 금액 업데이트
	            document.getElementById("finalTotalPrice").innerText = finalTotalPrice;
	            
	            return {
	                finalTotalPrice,
	                finalTotalCount,
	                selectedProducts
	            };
	        }
	
	        // 페이지 로드 시 초기 총 가격 계산
	        updateTotal();
	
	        // 수량 변경 시 가격 자동 업데이트
	        document.querySelectorAll("#count").forEach((input) => {
	            input.addEventListener("input", updateTotal);
	            
	         	// Enter 키 방지(Enter 누르면 submit 호출하는 현상 방지)
	            input.addEventListener("keydown", function (event) {
	                if (event.key === "Enter") {
	                    event.preventDefault(); // 기본 동작(Submit) 막기
	                }
	            });
	            
	        });
	        
	     	// 체크박스 변경 시에도 총 가격 다시 계산
	        document.querySelectorAll("input[type='checkbox']").forEach((checkbox) => {
	            checkbox.addEventListener("change", updateTotal);
	        });
	     	
	     	// **폼 제출 시 선택된 데이터 hidden input에 담기**
	        document.querySelector("form").addEventListener("submit", function (event) {
	        	
	        	// 폼 제출 막기
	        	event.preventDefault();
	        	
	            let { finalTotalPrice, finalTotalCount, selectedProducts } = updateTotal();
	            
	            // 선택된 상품이 없으면 결제 진행 X
	            if (selectedProducts.length === 0) {
	                alert("선택된 상품이 없습니다!");
	                return;
	            }
	            
	            // RequestBody는 1개만 작성가능
	            // 그래서 orders 안에 데이터 다 때려박음
	         	// 객체로 데이터 구성
	            let requestData = {
	                ordersTotalCount: finalTotalCount,
	                ordersTotalPrice: finalTotalPrice,
	                ordersDetailList: selectedProducts,
	                ordersPaymentMethod: document.getElementById("ordersPaymentMethod").value,
	                addressDTO: {
	                    addressId: document.getElementById("addressId").value,
	                    addressName: document.getElementById("addressName").value,
	                    addressRoadAddress: document.getElementById("addressRoadAddress").value,
	                    addressDetailAddress: document.getElementById("addressDetailAddress").value,
	                    addressPostCode: document.getElementById("addressPostCode").value,
	                    addressPhoneNumber: document.getElementById("addressPhoneNumber").value
	                }
	            };

				let csrf = document.querySelector('meta[name="_csrf"]').content;
				let csrf_header = document.querySelector('meta[name="_csrf_header"]').content;
				
	            // 비동기 요청 - form으로 List<OrdersDetailDTO> ordersDetailList 보낼경우 modelattribue가 처리를 못함
	            // 그래서 formdata에 별도로 추가해서 fetch로 전송
	            // headers 객체에서 변수를 키 값으로 사용할 경우 대괄호([])를 사용해야 해.
	            fetch("/product/pay",{
	            	method: "POST",
	            	headers: { "Content-Type": "application/json",
	            		[csrf_header]: csrf
	            	},
	            	body: JSON.stringify(requestData)
	            })
	            .then(response => response.json())
	            .then(data => 
		            // 서버에서 받은 redirect URL로 이동
		            {window.location.href = data.redirectUrl}
	            )
	            .catch(error => {
	                console.error("에러 발생:", error);
	                alert("결제 처리 중 오류가 발생했습니다.");
	            });
	            
	        });
	     	
	    });
        
     	// 부모 창에서 주소를 설정하는 함수 (결제 페이지)
        window.setAddressCallback = function(data) {
        	document.getElementById("addressRoadAddress").setAttribute("value", data.roadAddress);
            document.getElementById("addressName").setAttribute("value", data.name);
            document.getElementById("addressRoadAddress").setAttribute("value", data.roadAddress);
            document.getElementById("addressDetailAddress").setAttribute("value", data.detailAddress);
            document.getElementById("addressPostCode").setAttribute("value", data.postCode);
            document.getElementById("addressPhoneNumber").setAttribute("value", data.phoneNumber);
        }

        // 팝업 열기 (부모 -> 팝업)
        function openAddressPopup() {
            let popup = window.open("/address/popup/listPaging", "배송지 목록", "width=600,height=600,scrollbars=yes");

         	// 팝업 객체가 존재하면 바로 `setAddressCallback`을 설정
			if (popup) {
		        popup.setAddressCallback = window.setAddressCallback;
		    }
        }
        
    </script>

</body>
</html>