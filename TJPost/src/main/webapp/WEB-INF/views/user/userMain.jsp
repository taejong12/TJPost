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
		<div class="row">
			<div class="col">
				<table id="boardTable" class="table table-bordered">
					<tr>
						<td id="boardTitle">제목</td>
					</tr>
					<c:choose>
						<c:when test="${empty boardList}">
							<tr>
								<td>등록된 게시물이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${boardList}">
								<tr>
									<td>
										<a href="/board/detail/${board.boardId}">${board.boardTitle}</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div class="col">
				<table id="boardTable" class="table table-bordered">
					<tr>
						<td id="boardTitle">상품</td>
					</tr>
					<c:choose>
						<c:when test="${empty boardList}">
							<tr>
								<td>등록된 상품이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${boardList}">
								<tr>
									<td>
										<a href="/board/detail/${board.boardId}">${board.boardTitle}</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
</body>
</html>