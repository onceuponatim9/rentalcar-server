<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="https://em-content.zobj.net/source/facebook/355/automobile_1f697.png">
<!--<link rel="stylesheet" href="/resources/style/grid.css">-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Rental Car Service</title>
</head>
<body>
	<header>
		<c:choose>
			<c:when test="${not empty user }">
			<button onclick="location.href='/logout'">로그아웃</button>
			</c:when>
			<c:otherwise>
			<button onclick="location.href='/login'">로그인</button>
			</c:otherwise>
		</c:choose>
		<%--
		if(session.getAttribute("user") == null) {
		--%>
			<!--  <button onclick="location.href='/login'">로그인</button>-->
		<%--
		} else {
		--%>
			<!--  <button onclick="location.href='/logout'">로그아웃</button>-->
		<%--
		}
		--%>
		
	</header>
</body>
</html>