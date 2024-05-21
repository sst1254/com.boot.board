<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script src="/webjars/jquery/3.6.0/dist/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">메인</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><c:if
							test="${empty sessionScope.principal}">
							<a class="nav-link" href="/auth/login">로그인</a>
						</c:if></li>
					<li class="nav-item"><c:if
							test="${empty sessionScope.principal}">
							<a class="nav-link" href="/auth/insertUser">회원가입</a>
						</c:if></li>
					<li class="nav-item"><c:if
							test="${!empty sessionScope.principal}">
							<a class="nav-link" href="/auth/logout">로그아웃</a>
						</c:if></li>
					<li class="nav-item"><a class="nav-link"
						href="/post/insertPost">글등록</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/post/getPostList">글목록</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>
