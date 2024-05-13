<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/style/booking.css">
</head>
<c:import url="/header" />
<script src="/resources/script/validation-booking.js"></script>
<body>
	<section id="root">
		<h2>예약하기</h2>
		<!-- 예약자명 연락처 차종 대여 기간 대여료 결제 방법 -->
		<form method="POST" action="/bookingFormAction">
			<div id="container"><span>예약자명</span><input type="text" id="name" name="name" value="${user.id }" disabled></div>
			<div id="container"><span>연락처</span><input type="text" id="phone" name="phone" value="${user.phone }"></div>
			<div id="container"><span>차종</span><input type="text" id="carName" name="carName" placeholder="차종"></div>
			<div id="container"><span>대여 시작 날짜</span><input type="text" id="start-date" name="start-date" placeholder="2024-05-13"></div>
			<div id="container"><span>대여 종료 날짜</span><input type="text" id="end-date" name="end-date" placeholder="2024-05-23"></div>
			<div id="container"><span>대여료</span><input type="text" id="price" name="price" value="${car.price }" disabled></div>
			<div id="container">
				<div id="radio-container">
					<span>결제 방법</span>
					<input type="radio" class="pay" id="pay-card" name="pay-way"
						value="card" ${user.gender eq 'card' ? 'checked' : '' }>
					<input type="radio" class="pay" id="pay-deposit" name="pay-way"
						value="deposit" ${user.gender eq 'deposit' ? 'checked' : ''}>
					<div>
						<label for="pay-card" id="pay-card-label"><div>카드</div></label>
						<label for="pay-deposit" id="pay-deposit-label"><div>무통장 입금</div></label>
					</div>
				</div>
			</div>
			
		</form>
	</section>
</body>
<c:import url="/footer" />
</html>