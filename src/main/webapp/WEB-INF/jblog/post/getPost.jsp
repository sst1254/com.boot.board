<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 상세</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<div class="card">
			<div class="card-header">
				<h1 class="card-title">${post.title}</h1>
			</div>
			<div class="card-body">
				<p class="card-text">${post.content}</p>
			</div>
			<div class="card-footer text-muted">
				<div class="btn-group">
					<a href="/post/updatePost/${post.id}" class="btn btn-primary">글
						수정</a>
					<button id="btn-delete" class="btn btn-secondary">글 삭제</button>
				</div>
				<a href="/post/getPostList" class="btn btn-link">뒤로 가기</a>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/js/post.js"></script>
	<script>
		$(document).ready(function() {
			let postAuthorId = "${post.user.id}";
			let currentUserId = "${sessionScope.principal.id}";

			// 현재 사용자가 작성자와 동일한 경우에만 삭제 버튼과 수정 버튼을 보여줌
			if (postAuthorId === currentUserId) {
				$("#btn-delete").show();
				$("a[href*='/post/updatePost/']").show();
			} else {
				$("#btn-delete").hide();
				$("a[href*='/post/updatePost/']").hide();
			}
		});
	</script>

</body>
</html>
