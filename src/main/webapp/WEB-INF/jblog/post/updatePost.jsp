<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
<div class="container mt-3">
	<h2>★글수정★</h2>
	
	
	
	<div class="mb-3 mt-3">
		<label for="title">제목:</label> <input type="text" value="${post.title }"
			id="title" placeholder="제목" name="title">
	</div>
	<div class="mb-3">
		<label for="content">내용:</label> <input type="text"
			value="${post.content }" id="content" placeholder="내용" name="content">
	</div>
	
	<input type="hidden" id="id" value="${post.id }">
	<button id="btn-update" class="btn btn-primary">글 다시수정하기</button>

</div>

<script src="/js/post.js"></script>
<%@ include file="../layout/footer.jsp"%>

</body>
</html>
