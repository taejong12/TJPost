<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	        <table class="table table-bordered">
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>작성일</th>
	                </tr>
	            </thead>
	            <tbody>
	                <!-- 게시글 목록 출력 -->
	                <!-- 예시 데이터 (실제 데이터는 서버에서 동적으로 로드됨) -->
	                <tr>
	                    <td>1</td>
	                    <td>첫 번째 게시글</td>
	                    <td>홍길동</td>
	                    <td>2025-01-20</td>
	                </tr>
	                <tr>
	                    <td>2</td>
	                    <td>두 번째 게시글</td>
	                    <td>김철수</td>
	                    <td>2025-01-19</td>
	                </tr>
	            </tbody>
	        </table>
	        <a href="boardWrite.jsp" class="btn btn-primary mb-3">글 작성하기</a>
	    </div>
	</body>
</html>