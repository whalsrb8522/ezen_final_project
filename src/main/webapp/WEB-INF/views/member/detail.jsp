<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양파마켓 | 내 상점</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/detail.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="container">
		<div id="innerContainer">
			<div id="memberProfile" class="border-gray">
				<div id="memberProfileLeft" class="background-gray">
					<div id="memberImage">
						<!-- 회원이 프로필 사진을 등록 안했을 경우 -->
						<c:if test="${empty member.mivo.mi_name}">
							<img alt="프로필 사진" src="/resources/img/profile.png">
						</c:if>
						<!-- 회원이 프로필 사진을 등록 했을 경우 -->
						<c:if test="${not empty member.mivo.mi_name}">
							<img alt="프로필 사진" src="/resources/fileUpload/${member.mivo.mi_dir}/${member.mivo.mi_uuid}_th_${member.mivo.mi_name}">
						</c:if>
					</div>
					<button type="button" onclick="location.href='/member/modify'" id="profileModifyBtn" class="background-purple">프로필 수정</button>
				</div>
				<div id="memberProfileRight">
					<h3>상점 ${member.mivo.m_number}호(${member.mvo.m_nick_name})</h3>
					<div id="memberStoreInfo">
						<p>
							<span class="material-symbols-outlined store-icon">
								storefront
							</span>
							상점 오픈일 2023.06.26
						</p>
						<p>
							<span class="material-symbols-outlined store-icon">
								shopping_basket
							</span>
							상품 판매 0회
						</p>
					</div>
					<div id="memberMain">
						<div id="memberMainLeft">
							<div id="memberMainIntroduce">
								${m_introduct }
							</div>
						</div>
						<div id="memberMainRight" class="background-purple">
							<p>사용가능 양파머니</p>
							<p id="memberLeftMoney">1,000,000 원</p>
						</div>
					</div>
				</div>
			</div>
			
			<div id="memberMenu">
				<button class="border-gray">상품 0</button>
				<button class="border-gray">상품후기 0</button>
				<button class="border-gray">찜 0</button>
			</div>
			
			<div id="memberProduct">
				<p>상품 0</p>
				
				<div id="productContainer">
					<div onclick="location.href='#'" class="product">
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
					
					<div onclick="location.href='#'" class="product">
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
					
					<div onclick="location.href='#'" class="product">
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
					
					<div onclick="location.href='#'" class="product">
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
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>