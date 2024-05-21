<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container mt-3">
	<h2>★글등록★</h2>
	
		<div class="mb-3 mt-3">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" placeholder="제목"
				name="title">
		</div>
		<div class="mb-3">
			<label for="content">내용:</label> <input type="text"
				class="form-control" id="content" placeholder="내용"
				name="content">
		</div>

		<button id="btn-insert" class="btn btn-primary">새글등록</button>

</div>

<script src="/js/post.js"></script>
<%@ include file="../layout/footer.jsp"%>

</body>
</html>
