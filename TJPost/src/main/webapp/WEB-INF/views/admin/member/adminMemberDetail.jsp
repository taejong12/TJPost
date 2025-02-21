<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원관리 상세페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminIndex.jsp"%>
	
		<div class="container mt-5">
		<h2 class="text-center mb-4">회원 상세보기</h2>
		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>공지사항 번호</th>
					<td>${boardDTO.boardId}</td>
				</tr>
				<tr>
					<th>공지사항 제목</th>
					<td>${boardDTO.boardTitle}</td>
				</tr>
				<tr>
					<th>공지사항 내용</th>
					<td>${boardDTO.boardContent}</td>
				</tr>
				<tr>
					<th>공지사항 작성자</th>
					<td>${boardDTO.memberId}</td>
				</tr>
				<tr>
					<th>공지사항 작성일</th>
					<td>${boardDTO.boardCreate}</td>
				</tr>
				<tr>
					<th>공지사항 수정일</th>
					<td>${boardDTO.boardUpdate}</td>
				</tr>
				<c:choose>
					<c:when test="${empty fileList}">
						<tr>
							<th colspan="2">등록된 파일이 없습니다.</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="file" items="${fileList}">
							<tr>
								<td><img src="/img/board/${file.fileName}" width="50"></td>
								<td>${file.fileOriginalName}</td>								
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<div class="text-center mt-4">
			<a href="/admin/member/list" class="btn btn-primary mr-2">회원 목록</a>
		</div>
	</div>
	
</body>
</html>