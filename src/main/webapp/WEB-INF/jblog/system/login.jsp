<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로-그-인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container mt-3">
		<h2>★로 그 인 ★</h2>
		<div class="mb-3 mt-3">
			<label for="usernanme">Username:</label> <input type="text"
				class="form-control" id="username" placeholder="아이디 입력"
				name="username">
		</div>
		<div class="mb-3">
			<label for="pwd">Password:</label> <input type="password"
				class="form-control" id="password" placeholder="비밀번호 입력"
				name="password">
		</div>
		<div class="form-check mb-3">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember">
				날...기~~~억해~~!
			</label>
		</div>
		<button id="btn-login" class="btn btn-primary">로그인</button>
	</div>

	<script src="/js/login.js"></script>
	<%@include file="../layout/footer.jsp"%>

</body>
</html>
