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
<title>배송추가 팝업페이지</title>
</head>
<body>
	<div class="container mt-5 mb-5 p-4 bg-light rounded shadow">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <h2 class="text-center mb-4 text-primary">배송지 추가</h2>
                
                <form action="/address/popup/insert" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    
                    <div class="mb-3">
                        <label for="addressName" class="form-label fw-bold">이름</label>
                        <input type="text" class="form-control" id="addressName" name="addressName" placeholder="이름을 입력하세요" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="addressPostCode" class="form-label fw-bold">우편번호</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="addressPostCode" name="addressPostCode" placeholder="우편번호" required readonly onclick="daumPostcode()">
                            <button type="button" class="btn btn-secondary" onclick="daumPostcode()">우편번호 찾기</button>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="addressRoadAddress" class="form-label fw-bold">도로명 주소</label>
                        <input type="text" class="form-control" id="addressRoadAddress" name="addressRoadAddress" placeholder="도로명 주소" required readonly onclick="daumPostcode()">
                    </div>
                    
                    <div class="mb-3">
                        <label for="addressDetailAddress" class="form-label fw-bold">상세주소</label>
                        <input type="text" class="form-control" id="addressDetailAddress" name="addressDetailAddress" placeholder="상세 주소를 입력하세요" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="addressPhoneNumber" class="form-label fw-bold">핸드폰번호</label>
                        <input type="text" class="form-control" id="addressPhoneNumber" name="addressPhoneNumber" placeholder="핸드폰 번호를 입력하세요" required>
                    </div>
                    
                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="addressDefaultAddress" name="addressDefaultAddress" value="Y">
                        <label class="form-check-label fw-bold" for="addressDefaultAddress">기본 배송지로 설정</label>
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">배송지 추가</button>
                    </div>
                </form>
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