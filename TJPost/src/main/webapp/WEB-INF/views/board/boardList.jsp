<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 페이지</title>
	</head>
	
	<body>
		<%@ include file="/WEB-INF/views/index.jsp" %>
		
		<div class="container mt-5">
	        <h2 class="text-center">게시판</h2>

	        <table id="boardTable" class="table table-bordered" >
				<tr>
					<td id="boardId">게시글 고유번호</td>
					<td id="boardTitle">제목</td>
					<td id="boardContent">내용</td>
					<td id="boardAuthor">작성자</td>
					<td id="boardCreatedDate">작성일자</td>
					
				</tr>
				<c:choose>
					<c:when test="${empty boardList}">
						<tr>
							<td colspan="5">등록된 게시물이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="boardList" items="${boardList}">
							<tr>
								<td>${boardList.boardId}</td>
								<td>
									${boardList.boardTitle}
								</td>
								<td>${boardList.boardContent}</td>
								<td>${boardList.boardAuthor}</td>
								<td>${boardList.boardCreatedDate}</td>	
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>

	        <a href="/board/write" class="btn btn-primary mb-3">글 작성하기</a>
	    </div>
	</body>
</html>