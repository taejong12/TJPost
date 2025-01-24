<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 수정하기 페이지</title>
	</head>
		
	<body>
		<%@ include file="/WEB-INF/views/index.jsp" %>
		
		<div class="container mt-5">
		    <h2 class="text-center mb-4">게시글 수정하기</h2>
		    <form action="/board/update" method="post">
		        <table class="table table-striped table-bordered">
		            <thead class="thead-dark">
		                <tr>
		                    <th>항목</th>
		                    <th>내용</th>
		                </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <th>BOARD_ID</th>
		                    <td>
		                        <input type="text" id="boardId" name="boardId" value="${boardDTO.boardId}" class="form-control" readonly>
		                    </td>
		                </tr>
		                <tr>
		                    <th>BOARD_TITLE</th>
		                    <td>
		                        <input type="text" id="boardTitle" name="boardTitle" value="${boardDTO.boardTitle}" class="form-control">
		                    </td>
		                </tr>
		                <tr>
		                    <th>BOARD_CONTENT</th>
		                    <td>
		                        <textarea id="boardContent" name="boardContent" class="form-control" rows="5">${boardDTO.boardContent}</textarea>
		                    </td>
		                </tr>
		                <tr>
		                    <th>BOARD_AUTHOR</th>
		                    <td>
		                        <input type="text" id="boardAuthor" name="boardAuthor" value="${boardDTO.boardAuthor}" class="form-control">
		                    </td>
		                </tr>
		                <tr>
		                    <th>BOARD_CREATED_DATE</th>
		                    <td>
		                        <input type="text" id="boardCreatedDate" name="boardCreatedDate" value="${boardDTO.boardCreatedDate}" class="form-control" readonly>
		                    </td>
		                </tr>
		                <tr>
		                    <th>BOARD_UPDATED_DATE</th>
		                    <td>
		                        <input type="text" id="boardUpdatedDate" name="boardUpdatedDate" value="${boardDTO.boardUpdatedDate}" class="form-control" readonly>
		                    </td>
		                </tr>
		            </tbody>
		        </table>
		
		        <div class="text-center mt-4">
		            <button type="submit" class="btn btn-success mr-2">수정 완료</button>
		            <a href="/board/detail/${boardDTO.boardId}" class="btn btn-secondary">취소</a>
		        </div>
		    </form>
		</div>
	</body>
</html>