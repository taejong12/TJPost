<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송목록</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/userIndex.jsp"%>
	
	<div class="container mt-5 mb-5">
		<div class="row">
			<%@ include file="/WEB-INF/views/user/member/memberSidebar.jsp"%>
			<div class="col-md-9">
				<div class="section p-4 bg-light rounded shadow-sm">
					<h3 class="mb-4">배송지 정보</h3>
					<c:forEach var="delivery" items="deliveryList">
						
					
					</c:forEach>
					<div class="d-grid mb-3 text-center">
						<a href="/delivery/insert" class="btn btn-outline-primary btn-sm w-100">배송지 추가</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>