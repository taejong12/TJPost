<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록 페이지</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>

	<div class="container mt-5">
		<h2 class="text-center">공지사항</h2>

		<!-- 정렬 옵션 & 상품 개수 선택을 가로 정렬 -->
		<div class="d-flex align-items-center gap-3 mb-3 justify-content-end">
		    <!-- 정렬 옵션 드롭다운 -->
		    <form id="sortForm" action="/board/listPaging" method="get">
		        <select name="sort" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('sortForm').submit();">
		            <option value="latest" ${sort == 'latest' ? 'selected' : ''}>최신순</option>
		            <%-- <option value="sales" ${sort == 'sales' ? 'selected' : ''}>판매량순</option>
		            <option value="highPrice" ${sort == 'highPrice' ? 'selected' : ''}>높은가격순</option>
		            <option value="lowPrice" ${sort == 'lowPrice' ? 'selected' : ''}>낮은가격순</option> --%>
		        </select>
		    </form>
		
		    <!-- 상품 개수 선택 -->
		    <form id="limitForm" action="/board/listPaging" method="get">
		        <input type="hidden" name="sort" value="${sort}">
		        <select name="limit" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('limitForm').submit();">
		            <option value="3" ${limit == 3 ? 'selected' : ''}>3개</option>
		            <option value="6" ${limit == 6 ? 'selected' : ''}>6개</option>
		            <option value="10" ${limit == 10 ? 'selected' : ''}>10개</option>
		        </select>
		    </form>
		</div>

		<table id="boardTable" class="table table-bordered">
			<tr>
				<td id="boardId">공지사항번호</td>
				<td id="boardTitle">제목</td>
				<td id="boardContent">내용</td>
				<td id="memberId">작성자</td>
				<td id="boardCreate">작성일자</td>

			</tr>
			<c:choose>
				<c:when test="${empty boardList}">
					<tr>
						<td colspan="5">등록된 공지사항이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>${board.boardId}</td>
							<td><a href="/board/detail/${board.boardId}">${board.boardTitle}</a>
							</td>
							<td>${board.boardContent}</td>
							<td>${board.memberId}</td>
							<td>${board.boardCreate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<!-- 페이징 -->
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
				
					 <!-- 맨 처음 페이지 이동 버튼 -->
		            <c:if test="${currentPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/board/listPaging?page=1&limit=${limit}&sort=${sort}">&laquo;&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
		             <!-- 이전 페이지 그룹 이동 버튼 -->
		            <c:if test="${startPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/board/listPaging?page=${startPage - pageBlock}&limit=${limit}&sort=${sort}">&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
					<!-- 이전 페이지 버튼 -->
					<c:if test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="/board/listPaging?page=${currentPage - 1}&limit=${limit}&sort=${sort}">&laquo;</a>
						</li>
					</c:if>

					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/board/listPaging?page=${i}&limit=${limit}&sort=${sort}">${i}</a>
						</li>
					</c:forEach>

					<!-- 다음 페이지 버튼 -->
					<c:if test="${currentPage < totalPage}">
						<li class="page-item">
							<a class="page-link" href="/board/listPaging?page=${currentPage + 1}&limit=${limit}&sort=${sort}">&raquo;</a>
						</li>
					</c:if>
					
					<!-- 다음 페이지 그룹 이동 버튼 -->
		            <c:if test="${endPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/board/listPaging?page=${startPage + pageBlock}&limit=${limit}&sort=${sort}">&raquo;&raquo;</a>
		                </li>
		            </c:if>
					
					<!-- 맨 마지막 페이지 이동 버튼 -->
		            <c:if test="${currentPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/board/listPaging?page=${totalPage}&limit=${limit}&sort=${sort}">&raquo;&raquo;&raquo;</a>
		                </li>
		            </c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>