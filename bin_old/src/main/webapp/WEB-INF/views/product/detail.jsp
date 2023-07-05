<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 글등록</title>
<link rel="stylesheet" type="text/css" href="/resources/css/product/detail.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div id="detail-wrap">
		<div id="top-wrap">
			<div id="detail-left">
				<div>
					<img alt="없음" src="/resources/image/44.jpg" width="300px" height="300px">
				</div>
				<div>페이지</div>
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
					<div id="detail-like">
						<span class="material-symbols-outlined md-15">favorite</span>
						539
					</div>
					<div id="detail-cnt">
						<span class="material-symbols-outlined md-15">visibility</span>
						784
					</div>
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
		<div>상세정보
			<div>상품 정보</div>
			<div>설명</div>
		</div>
		<div>장소
			<div>거래 희망 장소</div>
			<div>지도</div>
		</div>
	
	
	
	
	
	
	</div>
	
	
	
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>