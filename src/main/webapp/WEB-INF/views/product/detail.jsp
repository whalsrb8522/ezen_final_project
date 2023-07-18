<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.myweb.www.domain.ProductVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 글보기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/product/detail.css">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28524d982cffea013a5f7c234898c8df&libraries=services"></script>

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<c:set var="pvo" value="${pdto.pvo }"></c:set>
	<c:set var="flist" value="${pdto.piList }"></c:set>
	<!-- 전체 틀 -->
	<div id="detail-wrap">
		<div id="detail-category">
			<div class="detail-category2">
				<div class="detail-cate-home"><span class="material-symbols-outlined detail-cate-home">home</span>홈</div>
				<div class="detail-category2"><span class="material-symbols-outlined detail-cate-home">chevron_right</span></div>
				<div id="detail-cate-wrap">
					<div id="detatil-cate-wrapper">
						<div id="detail-cate">
							선택한 카테고리
							<span class="material-symbols-outlined arrow-down">expand_more</span>
						</div>
						<div class="detail-cate-scroll">
							<a class="scroll-detail">전자기기</a>
							<a class="scroll-detail">아웃도어, 스포츠</a>
							<a class="scroll-detail">자동차용품, 공구</a>
							<a class="scroll-detail">가구, 조명</a>
							<a class="scroll-detail">유아, 완구</a>
							<a class="scroll-detail">생활, 주방, 건강</a>
							<a class="scroll-detail">패션, 잡화</a>
							<a class="scroll-detail">사무, 취미</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="top-wrap">
			<hr>
			<br>
			<!-- 거래 상태 표시 -->
			<div>
				<select name="p_status" class="product-status">
	 	 			<option disabled>판매상태</option>
	  				<option value="0" selected>구매가능</option>
	  				<option value="1">예약중</option>
	  				<option value="2">거래완료</option>
				</select>
			</div>
			
			
			<div id="detail-left">
				<div>
					<img alt="없음" src="/resources/image/44.jpg" width="300px" height="300px">
				</div>
				<div class="slider-dot">
                	<a href="#" class="dot active">이미지1</a>
                	<a href="#" class="dot">이미지2</a>
                	<a href="#" class="dot">이미지3</a>
               		<a href="#" class="dot">이미지4</a>
               	 	<a href="#" class="dot">이미지5</a>
            	</div>
			</div>
			<div id="detail-right">
				<div id="title-wrap">
					<input type="hidden" value="${pvo.p_number }"> 
					<div id="detail-title">${pvo.p_name }</div>
					<div id="price-wrap">
						<div id="detail-price">${pvo.p_price } <span style="font-size:24px">원</span></div>
						<div id="detail-pay">양파페이</div>
					</div>
				</div>
				<div id="little-wrap">
					<!-- 찜 개수 -->
					<div id="detail-like">
						<span class="material-symbols-outlined md-15">favorite</span>
						${pvo.p_like }
					</div>
					<!-- 조회수 -->
					<div id="detail-cnt">
						<span class="material-symbols-outlined md-15">visibility</span>
						${pvo.p_read_count }
					</div>
					<!-- 등록일 -->
					<div id="detail-date">
						<span class="material-symbols-outlined md-15">schedule</span>
						<fmt:parseDate value="${pvo.p_reg_date }" var="regDate" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${regDate }" pattern="yyyy-MM-dd" />
					</div>
				</div>
				<!-- 구매자용 버튼 -->
				<!-- <div class="btn-wrap">
					<button type="button" class="background-gray detail-btn">다른 상품 찾기</button>
					<button type="button" class="background-gray detail-btn">찜</button>
					<button type="button" class="background-purple detail-btn">채팅하기</button>
				</div> -->
				<!-- 판매자용 버튼 -->
				<div class="btn-wrap">
					<button type="button" class="background-gray detail-btn">다른 상품 찾기</button>
					<button type="button" class="background-gray detail-btn">수정하기</button>
					<button type="button" class="background-purple detail-btn" onclick="location.href='/chat/register'">내 채팅방</button>
				</div>
			</div>
		</div>
		<br>
		<br>
		<hr>
		<div id="bottom-wrap">
			<div id="both-wrap">
				<div id="info-wrap">
					<div class="detail-pro-info"><b>상품 정보</b></div>
					<div id="detail-info">
						${pvo.p_info }
					</div>
				</div>
				<div id="product-member-wrap">
					<div class="detail-pro-info"><b>상점정보</b></div>
					<div id="pro-mem-wrap">
						<div id="product-store">
							<div id="product-profile">
								<a class="pro-file-photo"><img alt="글쓴이프로필사진" src="/resources/image/44.jpg" style="width:48px;height:48px;"></a>
							</div>
							<div>
								<div><a>닉네임</a></div>
								<div><a class="store-cnt">상품 몇 개</a></div>
							</div>
						</div>
						<div>
							<div id="store-review">상점후기 <span id="review-cnt">2</span></div>
						</div>
						<!-- 상점후기 -->
						<div>
							<div class="product-review">
								<a class="review-profile"><img alt="리뷰쓴사람프로필사진" src="/resources/image/44.jpg" style="width:32px;height:32px"></a>
								<div class="review-info">
									<div class="reviewer">
										<a class="review-nick">리뷰쓴사람닉네임</a>
									</div>
									<div class="review-score">
										<div class="star-score">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
										</div>
									</div>
									<div class="review-detail">빠른 거래 좋았습니다~~~~~!!!!fkflskdfksjldfkjsldfkjsldfkjsdlfkjsldfk
									sdlfkjsldkfjsldkfjslfkjsldfksjdfsj
									sdkfjlsdkfjsldfkjsdlfksjdflskdfjlesrisdpfisdf
									adflskjdfpoiakgnlafvdv
									aslkjfsldkjflsdkjflasdlfjasldfjsldfsldfkj!!!!!!</div>
								</div>
							</div>
						</div>
						<!-- 상점후기 2 -->
						<div>
							<div class="product-review">
								<a class="review-profile"><img alt="리뷰쓴사람프로필사진" src="/resources/image/44.jpg" style="width:32px;height:32px"></a>
								<div class="review-info">
									<div class="reviewer">
										<a class="review-nick">리뷰쓴사람닉네임</a>
									</div>
									<div class="review-score">
										<div class="star-score">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
											<img alt="별점이미지" src="/resources/image/star.png" style="width:15px;height:14px">
										</div>
									</div>
									<div class="review-detail">빠른 거래 좋았습니다~~~~~!!!!fkflskdfksjldfkjsldfkjsldfkjsdlfkjsldfk
									sdlfkjsldkfjsldkfjslfkjsldfksjdfsj
									sdkfjlsdkfjsldfkjsdlfksjdflskdfjlesrisdpfisdf
									adflskjdfpoiakgnlafvdv
									aslkjfsldkjflsdkjflasdlfjasldfjsldfsldfkj!!!!!!</div>
								</div>
							</div>
						</div>
						<!-- 상점후기 끝 -->
					</div>
				</div>
			</div>
			<div id="location-wrap">
				<div id="location-detail-wrap">
					<div id="detail-loca"><b>거래 희망 장소</b></div>
					<div id="detail-detail-loca">&gt; <input type="text" id="getLoca" readonly="readonly" value="${pvo.p_location }" style="border:none;"></div>
				</div>
					<div id="detail-map"></div>
			</div>
		</div>
	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/product/detail.js"></script>
<script type="text/javascript">
	const p_status = `<c:out value="${pvo.p_status}"/>`;
</script>
</body>
</html>