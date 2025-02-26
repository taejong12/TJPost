<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>배송목록 팝업페이지</title>
</head>
<body>
	<div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-9">
                <div class="list-group">
                    <c:choose>
                        <c:when test="${empty addressList}">
                            <div class="text-center">
                                <p>등록된 배송지가 없습니다.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="address" items="${addressList}" varStatus="status">
                                <label class="list-group-item d-flex align-items-center w-100" for="selectedAddress${status.index}">
                                    <div class="form-check me-3">
                                        <input type="radio" class="form-check-input form-check-lg" id="selectedAddress${status.index}" 
                                               name="selectedAddress" value="${address.addressId}" 
                                               ${address.addressDefaultAddress == 'Y' ? 'checked' : ''}>
                                    </div>
                                    <div>
                                        <h5 class="mb-1">이름: ${address.addressName}</h5>
                                        <p class="mb-1">우편번호: ${address.addressPostCode}</p>
                                        <p class="mb-1">도로명주소: ${address.addressRoadAddress}</p>
                                        <p class="mb-1">상세주소: ${address.addressDetailAddress}</p>
                                        <p class="mb-1">핸드폰번호: ${address.addressPhoneNumber}</p>
                                    </div>
                                </label>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- 페이징 -->
                <div class="d-flex justify-content-center m-3">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:if test="${startPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="/address/popup/listPaging?page=${startPage - pageBlock}&limit=${limit}">&laquo;&laquo;</a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="/address/popup/listPaging?page=${i}&limit=${limit}">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${endPage < totalPage}">
                                <li class="page-item">
                                    <a class="page-link" href="/address/popup/listPaging?page=${startPage + pageBlock}&limit=${limit}">&raquo;&raquo;</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
                <div class="d-grid gap-2 mb-3 text-center">
				    <a href="/address/popup/insert" class="btn btn-outline-primary btn-lg w-100">배송지 추가</a>
				</div>
				
				<div class="d-grid gap-2 text-center">
				    <button class="btn btn-success btn-lg w-100 btn-select">선택</button>
				    <button class="btn btn-outline-secondary btn-lg w-100 btn-cancel">취소</button>
				</div>
            </div>
        </div>
    </div>
    <script>
	    $(document).ready(function () {
	    	// 선택 버튼 클릭 시
	        $(".btn-select").click(function () {
	            let selectedAddress = $("input[name='selectedAddress']:checked");

	            if (selectedAddress.length === 0) {
	                alert("배송지를 선택해주세요.");
	                return;
	            }

	            let addressData = {
	                id: selectedAddress.val(),
	                name: selectedAddress.closest("label").find("h5").text().replace("이름: ", ""),
	                postCode: selectedAddress.closest("label").find("p:nth-of-type(1)").text().replace("우편번호: ", ""),
	                roadAddress: selectedAddress.closest("label").find("p:nth-of-type(2)").text().replace("도로명주소: ", ""),
	                detailAddress: selectedAddress.closest("label").find("p:nth-of-type(3)").text().replace("상세주소: ", ""),
	                phoneNumber: selectedAddress.closest("label").find("p:nth-of-type(4)").text().replace("핸드폰번호: ", "")
	            };
	            
				
	            console.log(addressData);
	            console.log(window.opener);
	            console.log(window.opener.setAddressCallback);
	            // 부모 창에서 전달한 콜백 함수 실행 (부모 창이 있으면 실행)
	            if (window.opener && typeof window.opener.setAddressCallback === "function") {
	                window.opener.setAddressCallback(addressData);
	            }

	            // 팝업 창 닫기
	            window.close();
	        });

	        // 취소 버튼 클릭 시 팝업 닫기
	        $(".btn-cancel").click(function () {
	            window.close();
	        });
	    });
	</script>
</body>
</html>
