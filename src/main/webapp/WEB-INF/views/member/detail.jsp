<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<div id="memberMainRight" class="background-purple">
							<p>사용가능 양파머니</p>
							<p id="memberLeftMoney">1,000,000 원</p>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 내 상품 수 가져오기 -->
			<c:set var="productCount" value="0" />
			<c:forEach items="${productList}" var="productList">
			    <c:if test="${productList.pvo.m_number == member.mvo.m_number}">
			        <c:set var="productCount" value="${productCount + 1}" />
			    </c:if>
			</c:forEach>
			
			<!-- 상품후기 가져오기 -->
			<c:set var="reviewCount" value="0" />
			<c:forEach items="${reviewList}" var="rvList">
				<c:set var="prvo" value="${rvList.prvo }"></c:set>
			    <c:if test="${prvo.pr_seller eq member.mvo.m_number}">
			        <c:set var="reviewCount" value="${reviewCount + 1}" />
			    </c:if>
			</c:forEach>
			
			<!-- 찜한 상품 수 가져오기 -->
			<c:set var="likedCount" value="${fn:length(likedProductList)}" />
			
			<div id="memberMenu">
				<button class="border-gray" onclick="showProductList()">상품 ${productCount}</button>
				<button class="border-gray" onclick="showrReviewList()">상품후기 ${reviewCount}</button>
				<button class="border-gray" onclick="showLikedProductList()">찜 ${likedCount}</button>
			</div>
			
			<div id="memberProduct">
				
				
				<!-- 상품 리스트 -->
				<%-- <div id="productContainer">
				    <c:forEach items="${productList}" var="product">
				        <c:if test="${product.pvo.m_number == member.mvo.m_number}">
				            <div onclick="location.href='/product/detail?p_number=${product.pvo.p_number}'" class="product">
				                <div class="product-image">
				                    <img alt="상품 이미지" src="../resources/fileUpload/${product.piList[0].pi_dir}/${product.piList[0].pi_uuid}_th_${product.piList[0].pi_name}">
				                </div>
				
				                <div class="product-text">
				                    <ul>
				                        <li class="product-title">${product.pvo.p_name}</li>
				                        <li class="product-price">${product.pvo.p_price}<span style="font-size: 12px;">원</span></li>
				                    </ul>
				                </div>
				
				                <div class="product-location">
				                    <span class="material-symbols-outlined">
				                        location_on
				                    </span>
				                    ${product.pvo.p_location}
				                </div>
				            </div>
				        </c:if>
				    </c:forEach>
				</div> --%>
				
				
				<div class="productList" style="display: block;">
					<p>상품 ${productCount}</p>
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
					
					<!-- 페이지네이션 -->
					<div id="page-wrap">
						<!-- 이전페이지 -->
						<c:if test="${pph.prev }">
							<div class="background-gray page-btn" onclick="location.href='/product/list?pageNo=${pph.startPage-1}&qty=${pph.ppvo.qty }&keyword=${pph.ppvo.keyword }'">&lt;</div>
						</c:if>
						<!-- 컨트롤러에서 page 정보를 싣고 와야 함 -->
						<!-- 숫자 페이지 -->
						<c:forEach begin="${pph.startPage }" end="${pph.endPage }" var="i">
							<div class="background-gray page-btn" onclick="location.href='/product/list?pageNo=${i}&qty=${pph.ppvo.qty}&keyword=${pph.ppvo.keyword }'">${i }</div>
						</c:forEach>
						<!-- 다음페이지 -->
						<c:if test="${pph.next }">
							<div class="background-gray page-btn" onclick="location.href='/product/list?pageNo=${pph.endPage+1}&qty=${pph.ppvo.qty}&keyword=${pph.ppvo.keyword }'">&gt;</div>
						</c:if>
					</div>
				</div>
				
				<!-- <div class="reviewList" style="display: none;">
					
				</div> -->
				
				<div id="memberReview" class="reviewList" style="display: none;">
					<p>상품후기 ${reviewCount}</p>
						<c:forEach items="${reviewList }" var="rvList">
							<c:if test="${rvList.prvo.pr_seller eq member.mvo.m_number }">
							<div class="product-review">
									<a class="review-profile" href="/product/store?m_number=${rvList.prvo.pr_buyer }">
									<!-- 회원이 프로필 사진을 등록 안했을 경우 -->
									<c:if test="${empty mivo.mi_name}">
										<img alt="프로필 사진" src="/resources/image/profile.png" style="width:32px;height:32px">
									</c:if>
									<!-- 회원이 프로필 사진을 등록 했을 경우 -->
									<c:if test="${not empty mivo.mi_name}">
										<img alt="프로필 사진" src="/resources/fileUpload/${mivo.mi_dir}/${mivo.mi_uuid}_th_${mivo.mi_name}" style="width:32px;height:32px">
									</c:if>
									</a>
									<div class="review-info">
										<div class="review-score">
											<div class="star-score">
											<c:forEach begin="1" end="${rvList.prvo.pr_score }">
												<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											</c:forEach>
											</div>
										</div>
										<div class="reviewer">
											<a class="review-nick" href="/product/store?m_number=${rvList.prvo.pr_buyer }">${rvList.prvo.pr_buyer } | 
											
											<fmt:parseDate value="${rvList.prvo.pr_reg_date }" var="regDate" pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate value="${regDate }" pattern="yyyy-MM-dd" /></a>
										</div>
										<div class="review-detail">${rvList.prvo.pr_content }</div>
									</div>
								</div>
								</c:if>
						</c:forEach>
						<%-- <div id="page-wrap">
						<!-- 이전페이지 -->
						<c:if test="${rph.prev }">
							<div class="background-gray page-btn" onclick="location.href='/product/store?pageNo=${rph.startPage-1}&qty=${rph.rpvo.qty }'">&lt;</div>
						</c:if>
						<!-- 컨트롤러에서 page 정보를 싣고 와야 함 -->
						<!-- 숫자 페이지 -->
						<c:forEach begin="${rph.startPage }" end="${rph.endPage }" var="i">
							<div class="background-gray page-btn" onclick="location.href='/product/store?pageNo=${i}&qty=${rph.rpvo.qty}'">${i }</div>
						</c:forEach>
						<!-- 다음페이지 -->
						<c:if test="${rph.next }">
							<div class="background-gray page-btn" onclick="location.href='/product/store?pageNo=${rph.endPage+1}&qty=${rph.rpvo.qty}'">&gt;</div>
						</c:if>
					</div> --%>
					
				</div>
				
			
				
				<div class="likedProductList" style="display: none;">
					<p>찜 ${likedCount}</p>
				    <c:forEach items="${likedProductList}" var="likedProduct">
				    	<c:set value="${likedProduct.piList }" var="piList"></c:set>
				        <div class="product-wrapper" onclick="location.href='/product/detail?p_number=${likedProduct.pvo.p_number }'">
				            <div class="product-photo">
				                <!-- You may need to adjust the way you access the image's src attribute, depending on how images are stored for your products -->
				                <img alt="없음" src="/resources/fileUpload/${likedProduct.piList[0].pi_dir }/${likedProduct.piList[0].pi_uuid }_th_${likedProduct.piList[0].pi_name }" class="product-photo">
				                <!-- 구매가능, 예약중, 거래완료 -->
				                <div class="product-status">
				                    <c:if test="${likedProduct.pvo.p_status eq 0 }">
				                        <img alt="" src="/resources/image/purchase.png">
				                    </c:if>
				                    <c:if test="${likedProduct.pvo.p_status eq 1 }">
				                        <img alt="" src="/resources/image/reservation.png">
				                    </c:if>
				                    <c:if test="${likedProduct.pvo.p_status eq 2 }">
				                        <img alt="" src="/resources/image/completed.png">
				                    </c:if>
				                </div>
				            </div>
				            <div style="display: none">${likedProduct.pvo.p_number }</div>
				            <div class="product-title">${likedProduct.pvo.p_name }</div>
				            <div class="product-price"><b><fmt:formatNumber value="${likedProduct.pvo.p_price }" pattern="#,###,###" /> <span style="font-size:12px">원</span></b></div>
				            
				            <div class="product-location">
				                <span class="material-symbols-outlined">location_on</span>
				                <span class="location-sub">${likedProduct.pvo.p_location }</span>
				            </div>
				        </div>
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
	<script type="text/javascript" src="/resources/js/member/detail.js"></script>
</body>
</html>