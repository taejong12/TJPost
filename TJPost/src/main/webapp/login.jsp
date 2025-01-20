<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 페이지</title>
	</head>
	
	<body>
		<%@ include file="index.jsp" %>
		<div class="container d-flex justify-content-center align-items-center" style="height: 60vh;">
			<div class="col-lg-4">
				<div class="card shadow" style="background-color: #f8f9fa; padding: 20px; border-radius: 10px;">
					<form method="post" action="loginAction.jsp">
						<h3 class="text-center mb-4">로그인 화면</h3>
						<div class="form-group mb-3">
							<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20" >
						</div>
						
						<div class="form-group mb-3">
							<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20" >
						</div>
						<input type="submit" class="btn btn-primary w-100" value="로그인">
					</form>
				</div>
			</div>

		</div>

	</body>

</html>