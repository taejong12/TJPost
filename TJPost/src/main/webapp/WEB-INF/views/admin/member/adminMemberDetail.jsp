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
		<div class="card shadow p-4">
			<div class="row">
				<div class="col-md-6">
					<h4 class="mb-3">회원 정보</h4>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><strong>회원아이디:</strong> ${adminMemberDTO.memberId}</li>
						<li class="list-group-item"><strong>회원이름:</strong> ${adminMemberDTO.memberName}</li>
						<li class="list-group-item"><strong>회원핸드폰번호:</strong> ${adminMemberDTO.memberPhoneNumber}</li>
						<li class="list-group-item"><strong>회원이메일:</strong> ${adminMemberDTO.memberEmail}</li>
						<li class="list-group-item"><strong>회원계정활성화:</strong> ${adminMemberDTO.memberEnabled}</li>
						<li class="list-group-item"><strong>회원생성일:</strong> ${adminMemberDTO.memberCreate}</li>
						<li class="list-group-item"><strong>회원수정일:</strong> ${adminMemberDTO.memberUpdate}</li>
						<li class="list-group-item"><strong>회원권한:</strong> ${adminMemberDTO.authoritiesAuthority}</li>
					</ul>
				</div>
				<%-- <div class="col-md-6 text-center">
					<h4 class="mb-3">첨부 파일</h4>
					<c:choose>
						<c:when test="${empty fileList}">
							<p class="text-muted">등록된 파일이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<div class="d-flex flex-wrap justify-content-center">
								<c:forEach var="file" items="${fileList}">
									<c:if test="${file.boardId == boardDTO.boardId}">
										<div class="m-2">
											<img src="/img/board/${file.fileName}" width="100" class="rounded shadow">
											<p class="mt-2 small">${file.fileOriginalName}</p>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div> --%>
			</div>
		</div>
		<div class="text-center mt-4">
			<a href="/admin/member/listPaging" class="btn btn-primary mr-2">회원관리 목록</a>
		</div>
	</div>
	
</body>
</html>