<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	상품 목록 페이지
	<div class="container p-5 my-5">
        <!-- 첫 번째 게시판 섹션 -->
        <div class="row mb-5">
            <div class="col-md-6">
                <h2>공지사항</h2>
                <div class="row">
                    <c:forEach var="board" items="${boardList}" varStatus="statusBoard">
                        <c:if test="${statusBoard.index < 9}">
                            <div class="col-md-4 mb-4">
                                <a href="/board/detail/${board.boardId}" class="text-decoration-none">
                                    <div class="card">
                                        <div class="carousel slide" data-bs-ride="carousel">
                                            <div class="carousel-inner">
                                            	<c:set var="isFirst" value="true"/>
                                                <c:forEach var="file" items="${fileList}">
                                                    <c:if test="${file.boardId == board.boardId}">
                                                        <div class="carousel-item ${isFirst ? 'active' : ''}">
                                                            <img src="/img/board/${file.fileName}" alt="공지사항 이미지" class="d-block w-100" style="height: 200px;">
                                                        </div>
                                                        <c:set var="isFirst" value="false"/>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">${board.boardTitle}</h5>
                                            <p class="card-text">${board.boardContent}</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
		</div>
	
	
</body>
</html>