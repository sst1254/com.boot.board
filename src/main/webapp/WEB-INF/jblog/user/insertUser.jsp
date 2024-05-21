<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<%@include file="../layout/header.jsp"%>
	<div class="container mt-3">

		<div class="mb-3 mt-3">
			<label for="mname" class="form-label">아이디</label> <input type="text"
				class="form-control" id="username" placeholder="아이디 입력"
				name="username">
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">비밀번호</label> <input
				type="password" class="form-control" id="password"
				placeholder="비밀번호 입력" name="password">
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label> <input type="email"
				class="form-control" id="email" placeholder="이메일 입력" name="email">
		</div>

		<button id="btn-save" class="btn btn-primary">회원가입</button>

	</div>
	
	<script src="/js/user.js"></script>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>