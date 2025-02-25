<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	<article class="container p-5 my-5">
		<div id="demo" class="carousel slide" data-bs-ride="carousel">

			<div class="carousel-indicators">
				<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="#"> 
						<img src="/img/main/mainPage1.jpg" alt="mainPage1" class="d-block" style="width: 100%; height: 400px;">
					</a>
				</div>
				<div class="carousel-item">
					<a href="#"> 
						<img src="/img/main/mainPage2.jpg" alt="mainPage2" class="d-block"	style="width: 100%; height: 400px;">
					</a>
				</div>
				<div class="carousel-item">
					<a href="#"> 
						<img src="/img/main/mainPage3.jpg" alt="mainPage3" class="d-block" style="width: 100%; height: 400px;">
					</a>
				</div>
			</div>

			<button class="carousel-control-prev" type="button"	data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"	data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
	</article>
	
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
                                                <c:forEach var="boardFile" items="${boardFileList}">
                                                    <c:if test="${board.boardId == boardFile.boardId}">
                                                        <div class="carousel-item ${isFirst ? 'active' : ''}">
                                                            <img src="/img/board/${boardFile.fileName}" alt="공지사항 이미지" class="d-block w-100" style="height: 200px;">
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
            <div class="col-md-6">
                <h2>상품</h2>
                <div class="row">
                    <c:forEach var="product" items="${productList}" varStatus="statusProduct">
                        <c:if test="${statusProduct.index < 9}">
                            <div class="col-md-4 mb-4">
                                <a href="/product/detail/${product.productId}" class="text-decoration-none">
                                    <div class="card">
                                        <div class="carousel slide" data-bs-ride="carousel">
                                            <div class="carousel-inner">
                                            	<c:set var="isFirst" value="true"/>
                                                <c:forEach var="productFile" items="${productFileList}" >
                                                    <c:if test="${productFile.productId == product.productId}">
                                                        <div class="carousel-item ${isFirst ? 'active' : ''}">
                                                            <img src="/img/product/${productFile.fileName}" alt="상품 이미지" class="d-block w-100" style="height: 200px;">
                                                        </div>
                                                        <c:set var="isFirst" value="false"/>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">${product.productName}</h5>
                                            <p class="card-text">${product.productPrice}</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        
        <!-- 두 번째 게시판 섹션 -->
        <div class="row mb-5">
            <div class="col-md-12">
                <h2>Q&A</h2>
                <div class="row">
                    <c:forEach var="board" items="${boardList3}" varStatus="status">
                        <c:if test="${status.index < 9}">
                            <div class="col-md-4 mb-4">
                                <a href="/board/detail/${board.boardId}" class="text-decoration-none">
                                    <div class="card">
                                        <div id="${board.boardId}" class="carousel slide" data-bs-ride="carousel">
                                            <div class="carousel-inner">
                                                <c:forEach var="file" items="${fileList3}" varStatus="statusFile">
                                                    <c:if test="${file.boardId == board.boardId}">
                                                        <div class="carousel-item ${statusFile.first ? 'active' : ''}">
                                                            <img src="/img/board/${file.fileName}" alt="공지사항 이미지" class="d-block w-100" style="height: 200px;">
                                                        </div>
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
    </div>
</body>
</html>