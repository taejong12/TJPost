<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원관리 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>
	<div class="container mt-5">
		<h2 class="text-center">회원관리</h2>

		<!-- 정렬 옵션 & 상품 개수 선택을 가로 정렬 -->
		<div class="d-flex align-items-center gap-3 mb-3 justify-content-end">
		    <!-- 정렬 옵션 드롭다운 -->
		    <form id="sortForm" action="/admin/member/listPaging" method="get">
		        <select name="sort" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('sortForm').submit();">
		            <option value="latest" ${sort == 'latest' ? 'selected' : ''}>최신순</option>
		            <%-- <option value="sales" ${sort == 'sales' ? 'selected' : ''}>판매량순</option>
		            <option value="highPrice" ${sort == 'highPrice' ? 'selected' : ''}>높은가격순</option>
		            <option value="lowPrice" ${sort == 'lowPrice' ? 'selected' : ''}>낮은가격순</option> --%>
		        </select>
		    </form>
		
		    <!-- 상품 개수 선택 -->
		    <form id="limitForm" action="/admin/member/listPaging" method="get">
		        <input type="hidden" name="sort" value="${sort}">
		        <select name="limit" class="form-select" style="width: auto; display: inline-block;" onchange="document.getElementById('limitForm').submit();">
		            <option value="3" ${limit == 3 ? 'selected' : ''}>3개</option>
		            <option value="6" ${limit == 6 ? 'selected' : ''}>6개</option>
		            <option value="10" ${limit == 10 ? 'selected' : ''}>10개</option>
		        </select>
		    </form>
		</div>

		<table id="memberTable" class="table table-bordered">
			<tr>
				<td id="memberId">회원아이디</td>
				<td id="memberName">회원이름</td>
				<td id="memberPhoneNumber">회원핸드폰번호</td>
				<td id="memberEmail">회원이메일</td>
				<td id="memberEnabled">회원계정활성화</td>
				<td id="memberCreate">회원생성일</td>
				<td id="memberUpdate">회원수정일</td>
				<td id="authoritiesAuthority">회원권한</td>
			</tr>
			
			<c:choose>
				<c:when test="${empty adminMemberList}">
					<tr>
						<td colspan="8">등록된 회원이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="adminMember" items="${adminMemberList}">
						<tr>
							<td>${adminMember.memberId}</td>
							<td>
								<a href="/admin/member/detail/${adminMember.memberId}">${adminMember.memberName}</a>
							</td>
							<td>${adminMember.memberPhoneNumber}</td>
							<td>${adminMember.memberEmail}</td>
							<td>${adminMember.memberEnabled}</td>
							<td>${adminMember.memberCreate}</td>
							<td>${adminMember.memberUpdate}</td>
							<td>${adminMember.authoritiesAuthority}</td>
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
		                    <a class="page-link" href="/admin/member/listPaging?page=1&limit=${limit}&sort=${sort}">&laquo;&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
		             <!-- 이전 페이지 그룹 이동 버튼 -->
		            <c:if test="${startPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/member/listPaging?page=${startPage - pageBlock}&limit=${limit}&sort=${sort}">&laquo;&laquo;</a>
		                </li>
		            </c:if>
		            
					<!-- 이전 페이지 버튼 -->
					<c:if test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="/admin/member/listPaging?page=${currentPage - 1}&limit=${limit}&sort=${sort}">&laquo;</a>
						</li>
					</c:if>

					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/admin/member/listPaging?page=${i}&limit=${limit}&sort=${sort}">${i}</a>
						</li>
					</c:forEach>

					<!-- 다음 페이지 버튼 -->
					<c:if test="${currentPage < totalPage}">
						<li class="page-item">
							<a class="page-link" href="/admin/member/listPaging?page=${currentPage + 1}&limit=${limit}&sort=${sort}">&raquo;</a>
						</li>
					</c:if>
					
					<!-- 다음 페이지 그룹 이동 버튼 -->
		            <c:if test="${endPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/member/listPaging?page=${startPage + pageBlock}&limit=${limit}&sort=${sort}">&raquo;&raquo;</a>
		                </li>
		            </c:if>
					
					<!-- 맨 마지막 페이지 이동 버튼 -->
		            <c:if test="${currentPage < totalPage}">
		                <li class="page-item">
		                    <a class="page-link" href="/admin/member/listPaging?page=${totalPage}&limit=${limit}">&raquo;&raquo;&raquo;</a>
		                </li>
		            </c:if>
				</ul>
			</nav>
		</div>
	</div>
	
</body>
</html>