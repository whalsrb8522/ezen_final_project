<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 글등록</title>
<link rel="stylesheet" type="text/css" href="/resources/css/product/detail.css">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28524d982cffea013a5f7c234898c8df"></script>

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
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
				<select name="product-status" class="product-status">
	 	 			<option disabled selected>판매상태</option>
	  				<option value="purcharse">구매가능</option>
	  				<option value="reservation">예약중</option>
	  				<option value="completed">거래완료</option>
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
					<div id="detail-title">필스너우르켈 500맥주잔 2개 팝니다(새상품)</div>
					<div id="price-wrap">
						<div id="detail-price">11,000 <span style="font-size:24px">원</span></div>
						<div id="detail-pay">양파페이</div>
					</div>
				</div>
				<div id="little-wrap">
					<!-- 찜 개수 -->
					<div id="detail-like">
						<span class="material-symbols-outlined md-15">favorite</span>
						539
					</div>
					<!-- 조회수 -->
					<div id="detail-cnt">
						<span class="material-symbols-outlined md-15">visibility</span>
						784
					</div>
					<!-- 등록일 -->
					<div id="detail-date">
						<span class="material-symbols-outlined md-15">schedule</span>
						2023-06-29
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
					<button type="button" class="background-purple detail-btn">내 채팅방</button>
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
						이 컵으로 말할 것 같으면 1859년 영국에서 시작되어 현재까지 전설로 내려오는 이야기 입니다..
					Contrary to popular belief, Lorem Ipsum is not simply random text. 
					It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. 
					Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more 
					obscure Latin words, 
					consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, 
					"de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. 
					This book is a treatise on the theory of ethics, very popular during the Renaissance. 
					The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
					t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. 
					The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, 
					content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their 
					default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions
					 have evolved over the years, sometimes by accident, 
					sometimes on purpose (injected humour and the like).
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
					<div id="detail-detail-loca">&gt; 장소</div>
				</div>
					<div id="detail-map"></div>
			</div>
		</div>
	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/product/detail.js"></script>
</body>
</html>