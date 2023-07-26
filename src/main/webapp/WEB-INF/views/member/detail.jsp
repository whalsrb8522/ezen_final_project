<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.myweb.www.domain.ProductVO" %>
<%@ page import="com.myweb.www.domain.ProductImageVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
							<img alt="프로필 사진" src="/resources/image/profile.png">
						</c:if>
						<!-- 회원이 프로필 사진을 등록 했을 경우 -->
						<!-- DB에 사진이 추가되고, 사진을 불러오기까지 오래걸림(10~30분 정도.. 왜지.. -->
						<c:if test="${not empty member.mivo.mi_name}">
							<img alt="프로필 사진" src="/resources/fileUpload/${member.mivo.mi_dir}/${member.mivo.mi_uuid}_th_${member.mivo.mi_name}">
							
						</c:if>
					</div>
					<button type="button" onclick="location.href='/member/modify'" id="profileModifyBtn" class="background-purple">프로필 수정</button>
				</div>
				<div id="memberProfileRight">
				
				<c:set var="completedSalesCount" value="0" />

				<c:forEach items="${productList}" var="product">
				    <c:if test="${product.m_number == member.mvo.m_number && product.p_status eq 2}">
				        <c:set var="completedSalesCount" value="${completedSalesCount + 1}" />
				    </c:if>
				</c:forEach>
					<!-- m_number / m_nick_name 출력 -->
					<h3>상점 ${member.mvo.m_number}호(${member.mvo.m_nick_name})</h3>
					<div id="memberStoreInfo">
						<p>
							<span class="material-symbols-outlined store-icon">
								storefront
							</span>
							<!-- 계정 생성일 -->
							상점 오픈일 ${fn:replace(member.mvo.m_reg_date, '-', '.')}
						</p>
						<p>
							<span class="material-symbols-outlined store-icon">
								shopping_basket
							</span>
							상품 판매 ${completedSalesCount}회
						</p>
					</div>
					<div id="memberMain">
						<div id="memberMainLeft">
							<div id="memberMainIntroduce">
								<c:choose>
							        <c:when test="${empty member.mvo.m_introduct}">
							            소개글을 입력해보세요.
							        </c:when>
							        <c:otherwise>
							            ${member.mvo.m_introduct}
							        </c:otherwise>
							    </c:choose>
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
				
				<!-- 상품 리스트 -->
				<div id="productContainer">
				    <c:forEach items="${productList}" var="product">
				        <c:if test="${product.m_number == member.mvo.m_number}">
				            <div onclick="location.href='/product/detail?p_number=${product.p_number}'" class="product">
				                <div class="product-image">
				                    <img alt="상품 이미지" src="/resources/fileUpload/${product.piList[0].pi_dir}/${product.piList[0].pi_uuid}_th_${product.piList[0].pi_name}">
				                </div>
				
				                <div class="product-text">
				                    <ul>
				                        <li class="product-title">${product.p_name}</li>
				                        <li class="product-price">${product.p_price}<span style="font-size: 12px;">원</span></li>
				                    </ul>
				                </div>
				
				                <div class="product-location">
				                    <span class="material-symbols-outlined">
				                        location_on
				                    </span>
				                    ${product.p_location}
				                </div>
				            </div>
				        </c:if>
				    </c:forEach>
				</div>



					
					
					
					
					
					<!-- <div onclick="location.href='#'" class="product">
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
					</div> -->
				</div>
			</div>
		</div>
	
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>