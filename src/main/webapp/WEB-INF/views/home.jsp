<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>양심거래 파트너 양파마켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/home.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
</head>
<body>
	<jsp:include page="./layout/header.jsp"></jsp:include>
	
	<div id="container">
		<div id="mainContainer">
			<div>
				<img alt="메인 이미지" src="" width="1024px" height="300px">
			</div>
			
			<div id="todayProduct">
				<h1>오늘의 상품</h1>
				
				<div id="productContainer">
					<div class="product">
						<div class="product-image">
							<img alt="상품 이미지" src="">
						</div>
						
						<div class="product-text">
							<ul>
								<li class="product-title">상품명</li>
								<li class="product-price">1,000,000 <span style="font-size: 12px;">원</span></li>
							</ul>
						</div>
						
						<div class="product-location">
							<span class="material-symbols-outlined">
								location_on
							</span>
							인천광역시 계양구
						</div>
					</div>
					
					<div class="product">
						<div class="product-image">
							<img alt="상품 이미지" src="">
						</div>
						
						<div class="product-text">
							<ul>
								<li class="product-title">상품명</li>
								<li class="product-price">1,000,000 <span style="font-size: 12px;">원</span></li>
							</ul>
						</div>
						
						<div class="product-location">
							<span class="material-symbols-outlined">
								location_on
							</span>
							인천광역시 계양구
						</div>
					</div>
					
					<div class="product">
						<div class="product-image">
							<img alt="상품 이미지" src="">
						</div>
						
						<div class="product-text">
							<ul>
								<li class="product-title">상품명</li>
								<li class="product-price">1,000,000 <span style="font-size: 12px;">원</span></li>
							</ul>
						</div>
						
						<div class="product-location">
							<span class="material-symbols-outlined">
								location_on
							</span>
							인천광역시 계양구
						</div>
					</div>
					
					<div class="product">
						<div class="product-image">
							<img alt="상품 이미지" src="">
						</div>
						
						<div class="product-text">
							<ul>
								<li class="product-title">상품명</li>
								<li class="product-price">1,000,000 <span style="font-size: 12px;">원</span></li>
							</ul>
						</div>
						
						<div class="product-location">
							<span class="material-symbols-outlined">
								location_on
							</span>
							인천광역시 계양구
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>
