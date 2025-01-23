<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 작성하기 페이지</title>
	</head>
	
	<body>
		<%@ include file="/WEB-INF/views/index.jsp" %>
		
		<div class="container mt-5">
	        <h2 class="text-center">글 작성하기</h2>
	        <!--  pageContext.request.contextPath는 현재 애플리케이션의 기본 경로를 포함하여 요청을 보낼 수 있도록 도와줍니다. -->
	        <form action="/board/write" method="post">
	            <div class="form-group">
	                <label for="boardTitle">제목</label>
	                <input type="text" class="form-control" id="boardTitle" name="boardTitle" required>
	            </div>
	            <div class="form-group">
	                <label for="boardContent">내용</label>
	                <textarea class="form-control" id="boardContent" name="boardContent" rows="5" required></textarea>
	            </div>
	            <div class="form-group">
			        <label for="boardAuthor">작성자:</label>
			        <input class="form-control" type="text" id="boardAuthor" name="boardAuthor" required />
			    </div>
	            
	            <button type="submit" class="btn btn-primary">작성</button>
	        </form>
	    </div>

	</body>
</html>