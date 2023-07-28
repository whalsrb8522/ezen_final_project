<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양파마켓 | 상점</title>
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
						<c:if test="${not empty member.mivo.mi_name}">
							<img alt="프로필 사진" src="/resources/fileUpload/${member.mivo.mi_dir}/${member.mivo.mi_uuid}_th_${member.mivo.mi_name}">
						</c:if>
					</div>
					<!-- 로그인 정보랑 글쓴이가 같아야 프로필 수정 가능 -->
					<c:if test="${member.mvo.m_number eq ses.m_number }">
						<button type="button" onclick="location.href='/member/modify'" id="profileModifyBtn" class="background-purple">프로필 수정</button>
					</c:if>
				</div>
				<div id="memberProfileRight">
				
				<c:set var="completedSalesCount" value="0" />

				<c:forEach items="${productList}" var="product">
				    <c:if test="${product.pvo.m_number == member.mvo.m_number && product.pvo.p_status eq 2}">
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
						<!-- 로그인 정보랑 글쓴이가 같아야 양파머니 확인 가능 -->
						<c:if test="${member.mvo.m_number eq ses.m_number }">
							<div id="memberMainRight" class="background-purple">
								<p>사용가능 양파머니</p>
								<p id="memberLeftMoney">1,000,000 원</p>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			
			<!-- 상품 수 가져오기 -->
			<c:set var="productCount" value="0" />
			<c:forEach items="${productList}" var="productList">
			    <c:if test="${productList.pvo.m_number == member.mvo.m_number}">
			        <c:set var="productCount" value="${productCount + 1}" />
			    </c:if>
			</c:forEach>
			
			<div id="memberMenu">
				<button class="border-gray">상품 ${productCount}</button>
				<button class="border-gray">상품후기 0</button>
			</div>
			
			<div id="memberProduct">
				<p>상품 ${productCount}</p>
				
				<div>
					<c:forEach items="${productList }" var="productList">
						<c:set value="${productList.piList }" var="piList"></c:set>
						<c:if test="${productList.pvo.m_number == member.mvo.m_number}">
						<div class="product-wrapper" onclick="location.href='/product/detail?p_number=${productList.pvo.p_number }'">
							<div class="product-photo">
								<img alt="없음" src="/resources/fileUpload/${productList.piList[0].pi_dir }/${productList.piList[0].pi_uuid }_th_${productList.piList[0].pi_name }" class="product-photo">
								<!-- 구매가능, 예약중, 거래완료 -->
								<div class="product-status">
								<c:if test="${productList.pvo.p_status eq 0 }">
									<img alt="" src="/resources/image/purchase.png">
								</c:if>
								<c:if test="${productList.pvo.p_status eq 1 }">
									<img alt="" src="/resources/image/reservation.png">
								</c:if>
								<c:if test="${productList.pvo.p_status eq 2 }">
									<img alt="" src="/resources/image/completed.png">
								</c:if>
								</div>
							</div>
							<div style="display: none">${productList.pvo.p_number }</div>
							<div class="product-title">${productList.pvo.p_name }</div>
							<div class="product-price"><b><fmt:formatNumber value="${productList.pvo.p_price }" pattern="#,###,###" /> <span style="font-size:12px">원</span></b></div>
							
							<div class="product-location">
								<span class="material-symbols-outlined">location_on</span>
								<span class="location-sub">${productList.pvo.p_location }</span>
							</div>
						</div>
						</c:if>
					</c:forEach>
				</div>
				</div>
			</div>
		</div>
	
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/product/list.js"></script>
</body>
</html>