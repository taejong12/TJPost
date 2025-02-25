<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 상세보기 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	<div class="container mt-5 mb-5">
		<div class="row">
			<%@ include file="/WEB-INF/views/user/member/memberSidebar.jsp"%>
			
			<div class="col-md-9">
				<div class="section p-4 bg-light rounded shadow-sm">
					<h3 class="mb-4">배송지 정보</h3>
					<form action="/address/update" method="post">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                    <input type="hidden" name="memberId" value="${addressDTO.memberId}">
	                    <input type="hidden" name="addressId" value="${addressDTO.addressId}">
	                    <div class="mb-3">
	                        <label for="addressName" class="form-label fw-bold">이름</label>
	                        <input type="text" class="form-control" id="addressName" name="addressName" value="${addressDTO.addressName}" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="addressPostCode" class="form-label fw-bold">우편번호</label>
	                        <div class="input-group">
	                            <input type="text" class="form-control" id="addressPostCode" name="addressPostCode" value="${addressDTO.addressPostCode}"required readonly onclick="daumPostcode()">
	                            <button type="button" class="btn btn-secondary" onclick="daumPostcode()">우편번호 찾기</button>
	                        </div>
	                    </div>
	                    <div class="mb-3">
	                        <label for="addressRoadAddress" class="form-label fw-bold">도로명 주소</label>
	                        <input type="text" class="form-control" id="addressRoadAddress" name="addressRoadAddress" value="${addressDTO.addressRoadAddress}" required readonly onclick="daumPostcode()">
	                    </div>
	                    <div class="mb-3">
	                        <label for="addressDetailAddress" class="form-label fw-bold">상세주소</label>
	                        <input type="text" class="form-control" id="addressDetailAddress" name="addressDetailAddress" value="${addressDTO.addressDetailAddress}" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="addressPhoneNumber" class="form-label fw-bold">핸드폰번호</label>
	                        <input type="text" class="form-control" id="addressPhoneNumber" name="addressPhoneNumber" value="${addressDTO.addressPhoneNumber}" required>
	                    </div>
	                    <div class="mb-4 form-check">
	                        <input type="checkbox" class="form-check-input" id="addressDefaultAddress" name="addressDefaultAddress" value="Y" ${addressDTO.addressDefaultAddress == 'Y' ? 'checked="checked"' : ''}>
	                        <label class="form-check-label fw-bold" for="addressDefaultAddress">기본 배송지로 설정</label>
	                    </div>
	                    <div class="d-grid mb-3 text-center">
	                    	<button type="submit" class="btn btn-outline-primary btn-sm-lg w-100">배송지 수정</button>
						</div>
						<div class="d-grid mb-3 text-center">
	                    	<a href="/address/delete/${addressDTO.addressId}" class="btn btn-outline-primary btn-sm-lg w-100">배송지 삭제</a>
						</div>
	                </form>
				</div>
			</div>
		</div>
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function daumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('addressPostCode').value = data.zonecode;
                    document.getElementById("addressRoadAddress").value = data.roadAddress;
                }
            }).open();
        }
    </script>
</body>
</html>