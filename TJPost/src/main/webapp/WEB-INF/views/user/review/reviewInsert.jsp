<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매후기 작성페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg">
                    <div class="card-body p-5">
                        <h2 class="text-center mb-4 text-primary fw-bold">구매 후기 작성</h2>

                        <form action="/review/insert" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                            <!-- 제목 입력 -->
                            <div class="mb-3">
                                <label for="reviewTitle" class="form-label fw-bold">제목</label> 
                                <input type="text" class="form-control" id="reviewTitle" name="reviewTitle" placeholder="제목을 입력하세요" required>
                            </div>

                            <!-- 내용 입력 -->
                            <div class="mb-3">
                                <label for="reviewContent" class="form-label fw-bold">내용</label>
                                <textarea class="form-control" id="reviewContent" name="reviewContent" rows="4" placeholder="내용을 입력하세요" required></textarea>
                            </div>

                            <!-- 점수 선택 -->
                            <div class="mb-3">
                                <label for="reviewScore" class="form-label fw-bold">점수</label>
                                <select name="reviewScore" id="reviewScore" class="form-select" required>
                                    <option value="1" selected>1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>

                            <!-- 주문번호 -->
                            <div class="mb-3">
                                <label for="ordersDetailId" class="form-label fw-bold">주문상세번호</label>
                                <input type="text" class="form-control" id="ordersDetailId" name="ordersDetailId" value="${ordersDetailId}" required readonly>
                            </div>

                            <!-- 파일 업로드 -->
                            <div class="mb-4">
                                <label for="reviewFiles" class="form-label fw-bold">구매 후기 파일</label> 
                                <input type="file" class="form-control" id="reviewFiles" name="reviewFiles" multiple>
                            </div>

                            <!-- 제출 버튼 -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">구매 후기 작성</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</body>
</html>