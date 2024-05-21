<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>글목록</title>
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
		<h2>글목록</h2>
		<table class="table">
			<thead>
				<tr>
					<th>userid</th>
					<th>Content</th>
					<th>cnt</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${postPage.content}">
					<tr>
						<td><a href="/post/getPost/${post.id}">${post.id}</a></td>
						<td>${post.content}</td>
						<td>${post.cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item ${postPage.first ? 'disabled' : ''}"><a
					class="page-link"
					href="/post/getPostList?page=${postPage.number - 1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="pageNum" begin="1" end="${postPage.totalPages}">
					<li
						class="page-item ${pageNum == postPage.number + 1 ? 'active' : ''}">
						<a class="page-link" href="/post/getPostList?page=${pageNum}">${pageNum}</a>
					</li>
				</c:forEach>
				<li class="page-item ${postPage.last ? 'disabled' : ''}"><a
					class="page-link"
					href="/post/getPostList?page=${postPage.number + 1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>

	</div>