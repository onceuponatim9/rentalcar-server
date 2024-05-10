<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="rentalcarServer.car.model.CarDao" %>
<%@page import="rentalcarServer.car.model.CarDto" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/style/reset-css.css">
<link rel="stylesheet" href="/resources/style/carList.css">
</head>
<jsp:include page="/header"></jsp:include>
<body>
<%
	CarDao dao = new CarDao();
	List<CarDto> list = dao.getList();
%>
	<div id="top-select-wrap">
		<select id="brand" name="brand">
			<%
			String[] brands = dao.getBrands();
			for(int i = 0; i < dao.getBrands().length; i++) {
			%>
			<option value="<%=brands[i] %>"><%=brands[i] %></option>
			<%
			}
			%>
		</select>
		<select id="region" name="region">
			<%
			String[] regions = dao.getRegions();
			for(int i = 0; i < dao.getRegions().length; i++) {
			%>
			<option value="<%=regions[i] %>"><%=regions[i] %></option>
			<%
			}
			%>
		</select>
		<select id="fuel" name="fuel">
			<%
			String[] fuels = dao.getFuels();
			for(int i = 0; i < dao.getFuels().length; i++) {
			%>
			<option value="<%=fuels[i] %>"><%=fuels[i] %></option>
			<%
			}
			%>
		</select>
	</div>
	<article>
	<%
	for(int i = 0; i < list.size(); i++) {
		CarDto dto = list.get(i);
	%>
		<div id="container-box">
			<div id="image">
				<!-- <img src="/resources/images/쉐보레 스파크.png"> -->
				<%
				String imgSrc = "/resources/images/" + dto.getBrand() + " " + dto.getName() + ".png";
				%>
				<img src="<%=imgSrc %>">
			</div>
			<div id="info">
				<div id="info-brand">
					<!-- <img src="resources/images/logos/logo_chevrolet.svg"> -->
					<%
					String logoSrc = "/resources/images/logos/logo_" + dto.getBrand() + ".svg ";
					%>
					<img src="<%=logoSrc %>">
					<div id="brand"><%=dto.getBrand() %></div>
				</div>
				<div id="name"><%=dto.getName() %></div>
				<div id="price"><%=dto.getPrice() %>원</div>
				
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
	<%
	}
	%>
	</article>
	<!-- 
	<article>
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/쉐보레 스파크.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_chevrolet.svg">
					<div id="brand">쉐보레</div>
				</div>
				<div id="name">스파크</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 모닝.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">모닝</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 레이.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">레이</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 K3(올뉴).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">K3(올뉴)</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/현대자동차 캐스퍼.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_hyundai.svg">
					<div id="brand">현대자동차</div>
				</div>
				<div id="name">캐스퍼</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 모닝(더뉴).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">모닝(더뉴)</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 레이(더뉴).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">레이(더뉴)</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/현대자동차 아반떼.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_hyundai.svg">
					<div id="brand">현대자동차</div>
				</div>
				<div id="name">아반떼</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 K3.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">K3</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 니로.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">니로</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 니로 플러스.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">니로 플러스</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/폭스바겐 제타.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_volkswagen.svg">
					<div id="brand">폭스바겐</div>
				</div>
				<div id="name">제타</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 EV6.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">EV6</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/현대자동차 아이오닉 5.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_hyundai.svg">
					<div id="brand">현대자동차</div>
				</div>
				<div id="name">아이오닉 5</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/폴스타 폴스타 2.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_polestar.svg">
					<div id="brand">폴스타</div>
				</div>
				<div id="name">폴스타 2</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/폭스바겐 ID.4.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_volkswagen.svg">
					<div id="brand">폭스바겐</div>
				</div>
				<div id="name">ID.4</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 K5.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">K5</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/현대자동차 아이오닉 6.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_hyundai.svg">
					<div id="brand">현대자동차</div>
				</div>
				<div id="name">아이오닉 6</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/현대자동차 쏘나타.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_hyundai.svg">
					<div id="brand">현대자동차</div>
				</div>
				<div id="name">쏘나타</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/아우디 A4.png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_audi.svg">
					<div id="brand">아우디</div>
				</div>
				<div id="name">A4</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">셀토스 (하이루프)</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">현대자동차</div>
				</div>
				<div id="name">스타리아</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">카니발 (YP)</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">현대자동차</div>
				</div>
				<div id="name">싼타페</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">기아자동차</div>
				</div>
				<div id="name">쏘렌토(MQ4)</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">현대자동차</div>
				</div>
				<div id="name">팰리세이드</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">제네시스</div>
				</div>
				<div id="name">GV80</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">벤츠</div>
				</div>
				<div id="name">GLS 클래스</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">벤츠</div>
				</div>
				<div id="name">GLC 클래스</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">벤츠</div>
				</div>
				<div id="name">EQB</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">벤츠</div>
				</div>
				<div id="name">C 클래스</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">BMW</div>
				</div>
				<div id="name">X7</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">BMW</div>
				</div>
				<div id="name">5 시리즈</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">BMW</div>
				</div>
				<div id="name">i4</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">BMW</div>
				</div>
				<div id="name">iX3</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">테슬라</div>
				</div>
				<div id="name">모델 3</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">테슬라</div>
				</div>
				<div id="name">모델 Y</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">MINI</div>
				</div>
				<div id="name">컨버터블</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
		
		<div id="container-box">
			<div id="image">
				<img src="/resources/images/기아자동차 셀토스 (하이루프).png">
			</div>
			<div id="info">
				<div id="info-brand">
					<img src="resources/images/logos/logo_kia.svg">
					<div id="brand">포르쉐</div>
				</div>
				<div id="name">타이칸</div>
				<div id="price">200,000원</div>
			</div>
			<button onclick="location.href='/carInfo'"><span>예약하기 ></span></button>
		</div>
	</article>
	 -->
</body>
<c:import url="/footer" />
</html>