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
        <!-- 결제 상품 정보 -->
        <div class="card p-4 mb-3">
            <h4 class="mb-3">결제 상품 정보</h4>
            <table class="table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="selectAll"></th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>총 가격</th>
                    </tr>
                </thead>
                <tbody id="productTableBody">
                    <tr>
                        <td><input type="checkbox" class="productCheckbox"></td>
                        <td>상품 A</td>
                        <td class="price">10000</td>
                        <td><input type="number" class="quantity" value="1" min="1"></td>
                        <td class="totalPrice">10000</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="productCheckbox"></td>
                        <td>상품 B</td>
                        <td class="price">20000</td>
                        <td><input type="number" class="quantity" value="1" min="1"></td>
                        <td class="totalPrice">20000</td>
                    </tr>
                </tbody>
            </table>
            <h5 class="text-end">총 결제 금액: <span id="totalAmount">0</span> 원</h5>
        </div>

        <!-- 배송지 정보 -->
        <div class="card p-4 mb-3">
            <h4 class="mb-3">배송지 정보</h4>
            <input type="text" class="form-control" placeholder="받는 사람">
            <input type="text" class="form-control mt-2" placeholder="주소">
            <input type="text" class="form-control mt-2" placeholder="전화번호">
        </div>

        <!-- 결제 수단 선택 -->
        <div class="card p-4 mb-3">
            <h4 class="mb-3">결제 수단 선택</h4>
            <select class="form-select">
                <option value="card">신용카드</option>
                <option value="bank">계좌이체</option>
                <option value="kakao">카카오페이</option>
            </select>
        </div>

        <!-- 결제 버튼 -->
        <div class="text-center">
            <button class="btn btn-primary" id="payButton">결제하기</button>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            function updateTotalAmount() {
                let total = 0;
                $(".productCheckbox:checked").each(function() {
                    let row = $(this).closest("tr");
                    let price = parseInt(row.find(".price").text());
                    let quantity = parseInt(row.find(".quantity").val());
                    let totalPrice = price * quantity;
                    row.find(".totalPrice").text(totalPrice);
                    total += totalPrice;
                });
                $("#totalAmount").text(total);
            }
            
            $("#selectAll").on("change", function() {
                $(".productCheckbox").prop("checked", $(this).prop("checked"));
                updateTotalAmount();
            });
            
            $(".productCheckbox, .quantity").on("input change", function() {
                updateTotalAmount();
            });
            
        });
    </script>
</body>
</html>