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

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- 전체 틀 -->
	<div id="detail-wrap">
		<div id="top-wrap">
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
				<div id="btn-wrap">
					<button type="button" class="background-gray detail-btn">찜</button>
					<button type="button" class="background-purple detail-btn">채팅하기</button>
				</div>
			</div>
		</div>
		<br>
		<hr>
		<div id="bottom-wrap">
			<div id="info-wrap">
				<div id="detail-pro-info"><b>상품 정보</b></div>
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
			<div id="location-wrap">
				<div id="detail-loca"><b>거래 희망 장소</b></div>
				<div id="detail-map">지도</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>