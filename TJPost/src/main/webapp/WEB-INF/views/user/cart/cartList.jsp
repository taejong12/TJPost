<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니목록</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>

	<div class="container mt-5">
		<!-- 결제 상품 정보 -->
		<div class="card p-4 mb-3">
			<h4 class="mb-3">장바구니목록</h4>
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
					<c:forEach var="cart" items="${cartList}">
						<tr>
							<!-- 체크박스 -->
							<td class="align-middle">
								<input type="checkbox" checked>
								<input type="hidden" id="cartId" name="cartId" value="${cart.cartId}">
								<input type="hidden" id="productId" name="productId" value="${cart.productId}">
								<input type="hidden" id="productStock" name="productStock" value="${cart.productStock}">
							</td>

							<td class="align-middle">
			                    <c:if test="${not empty fileList}">
			                    	<c:set var="imagePrinted" value="false"/>
			                    	<c:forEach var="file" items="${fileList}">
			                    		<c:if test="${file.productId == cart.productId && !imagePrinted}">
					                        <img src="/img/product/${file.fileName}" 
					                             alt="상품이미지" 
					                             class="img-fluid rounded" 
					                             style="max-width: 100px; height: auto;">
					                    	<c:set var="imagePrinted" value="true"/>
			                    		</c:if>
			                    	</c:forEach>
			                    </c:if>
			                </td>

							<!-- 상품명 -->
							<td class="align-middle" id="cartProductName">${cart.cartProductName}</td>

							<!-- 가격 -->
							<td class="align-middle fw-bold text-primary" id="cartProductPrice">${cart.cartProductPrice}원</td>

							<!-- 수량 입력 -->
							<td class="align-middle">
								<input type="number" id="cartCount" name="cartCount" value="${cart.cartCount}" min="1" max="${cart.productStock}" class="form-control w-50 mx-auto text-center">
							</td>

							<!-- 총 가격 -->
							<td class="align-middle fw-bold text-danger" id="cartTotalPrice">${cart.cartTotalPrice}원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h5 class="text-end">총 결제 금액: <span id="cartFinalTotalPrice"></span> 원</h5>
		</div>

		<div class="d-flex justify-content-center gap-3 mb-5">
			<button class="btn btn-outline-success btn-lg w-50" id="productListInfo">💳 결제하기</button>
			<button class="btn btn-outline-danger btn-lg w-50" id="deleteCart">🗑️ 장바구니 삭제</button>
		</div>
	</div>

	<script>
		document.addEventListener("DOMContentLoaded", function (){

			function updateTotal(){
				let cartFinalTotalPrice = 0;

				let selectedCartList = [];

				document.querySelectorAll("tbody tr").forEach((row) => {
					let checkbox = row.querySelector("input[type='checkbox']");
					if(!checkbox.checked) return;

					let cartId = parseInt(row.querySelector("#cartId").value);
					let cartProductName = row.querySelector("#cartProductName").innerText.trim();
					let cartProductPrice = parseInt(row.querySelector("#cartProductPrice").innerText.replace("원","").trim());
					let cartCountRow = row.querySelector("#cartCount");
					let cartTotalPriceRow = row.querySelector("#cartTotalPrice");
					let productId = parseInt(row.querySelector("#productId").value);
					let productStock = parseInt(row.querySelector("#productStock").value);
					
					if(parseInt(cartCountRow.value) > productStock){
						cartCountRow.value = productStock;
					}
					
					let cartCount = parseInt(cartCountRow.value);
					
					if(isNaN(cartCount) || cartCount === "" || cartCount < 1){
						cartCount = 0;
					}
					
					let cartTotalPrice = cartProductPrice * cartCount;
					
					cartTotalPriceRow.innerText = cartTotalPrice + "원";

					cartFinalTotalPrice += cartTotalPrice;
					
					selectedCartList.push({
						productId: productId,
						productName: cartProductName,
						productPrice: cartProductPrice,
						productPayTotalCount: cartCount,
						productTotalPrice: cartTotalPrice
					});
				});
				
				document.getElementById("cartFinalTotalPrice").innerText = cartFinalTotalPrice;
				
				return {
					cartFinalTotalPrice,
					selectedCartList
				}
			};
			
			updateTotal();
			
			document.querySelectorAll("#cartCount").forEach((input) => {
				input.addEventListener("input", updateTotal);
				
				input.addEventListener("keydown", function (event){
					if(event.key === "Enter") {
						event.preventDefault();
					}
				});
			});
			
			document.querySelectorAll("input[type='checkbox']").forEach((checkbox) => {
				checkbox.addEventListener("change", updateTotal);
			});
			
			
			document.querySelector("#deleteCart").addEventListener("click", function (){
				let selectedCartIdList = [];
				
				document.querySelectorAll("tbody tr").forEach((row) => {
					let checkbox = row.querySelector("input[type='checkbox']");
					if(checkbox.checked){
						let cartId = parseInt(row.querySelector("#cartId").value);
						selectedCartIdList.push(cartId);
					}
				});
				
				if(selectedCartIdList.length === 0){
					alert("삭제할 상품을 선택하세요.");
					return;
				}
				
				let csrf = document.querySelector('meta[name="_csrf"]').content;
				let csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
				
				fetch("/cart/delete", {
					method: "POST",
					headers:{
						"Content-Type":"application/json",
						[csrfHeader]:csrf
					},
					body: JSON.stringify(selectedCartIdList)
				})
				.then(response => response.text())
				.then(text => {
					alert(text);
					location.reload();
				})
				.catch(error => {
					console.error("장바구니 삭제 중 오류 발생:", error);
			        alert("장바구니 삭제 중 오류가 발생했습니다.");
				});
			});
	
			document.querySelector("#productListInfo").addEventListener("click", function () {
	        	
	            let { selectedCartList } = updateTotal();
	
	            if (selectedCartList.length === 0) {
	                alert("선택된 상품이 없습니다");
	                return;
	            }
	
				let csrf = document.querySelector('meta[name="_csrf"]').content;
				let csrf_header = document.querySelector('meta[name="_csrf_header"]').content;
				
	            fetch("/product/productListInfo",{
	            	method: "POST",
	            	headers: { "Content-Type": "application/json",
	            		[csrf_header]: csrf
	            	},
	            	body: JSON.stringify(selectedCartList)
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