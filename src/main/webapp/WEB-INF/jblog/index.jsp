<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./layout/header.jsp"%>
<%@ page import="com.example.demo.dormain.User"%>
<!-- 이 부분을 추가해 주세요 -->
<br>

<div class="container mt-3">
	<% if (session.getAttribute("principal") != null) { %>
	<h2>
		안녕하세요,
		<%= ((User) session.getAttribute("principal")).getUsername() %>님
	</h2>
	<% } else { %>
	<h2>로그인하세요</h2>
	<a href="/auth/login">로그인</a>
	<% } %>
</div>

<%@ include file="./layout/footer.jsp"%>
