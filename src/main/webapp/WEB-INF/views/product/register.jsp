<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 글등록</title>
<link rel="stylesheet" type="text/css" href="/resources/css/product/register.css">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28524d982cffea013a5f7c234898c8df"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<form action="/" method="post">
	<div id="register-wrap">
		
		<div id="image-wrap">
			<div class="register-title">상품이미지</div>
			<div id="file-wrap">
				<ul class="file-ul">
					<li class="file-li">
						이미지 등록
						<input type="file" multiple class="file-input">
					</li>
					<li class="regi-file">
						<img alt="상품이미지" src="/resources/image/44.jpg">
						<button type="button" class="file-del"></button>
					</li>
					<li class="regi-file">
						<img alt="상품이미지" src="/resources/image/44.jpg">
						<button type="button" class="file-del"></button>
					</li>
				</ul>
				
			</div>
		</div>
		
		<div id="title-wrap">
			<div class="register-title">제목</div>
			<div>
				<input class="border-gray title-input" placeholder="상품 제목을 입력해 주세요.">
				<a href="/" class="input-a">거래금지품목</a>
			</div>
			<div>0/20</div>
		</div>
		
		<div id="cate-wrap">
			<div class="register-title">카테고리</div>
			<div class="cate-wrapper border-gray">
				<div class="cate-box">
					<ul class="cate-ul">
						<li class="cate-li">
							<button type="button" class="cate-btn">전자기기</button>
						</li>
						<li class="cate-li">
							<button type="button" class="cate-btn">아웃도어, 스포츠</button>
						</li>
						<li class="cate-li">
							<button type="button" class="cate-btn">자동차용품, 공구</button>
						</li>
						<li class="cate-li">
							<button type="button" class="cate-btn">가구, 조명</button>
						</li>
						<li class="cate-li">
							<button type="button" class="cate-btn">유아, 완구</button>
						</li>
						<li class="cate-li">
							<button type="button" class="cate-btn">생활, 주방, 건강</button>
						</li>
						<li class="cate-li">
							<button type="button" class="cate-btn">패션, 잡화</button>
						</li>
						<li class="cate-li">
							<button type="button" class="cate-btn">사무, 취미</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div id="loca-wrap">
			<div class="register-title">거래 희망 장소</div>
			<div>주소 검색</div>
			<div id="regi-map" style="width:500px; height:400px;">지도</div>
		</div>
		
		<div id="price-wrap">
			<div class="register-title">가격</div>
			<div>
				<input class="border-gray title-input" placeholder="숫자만 입력해 주세요.">
				<span>원</span>
			</div>
		</div>
		
		<div id="info-wrap">
			<div class="register-title">설명</div>
			<div id="regi-info">
				<textarea rows="8" class="info-text border-gray" 
				placeholder="여러 장의 상품 사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요."></textarea>
			</div>
			<div>0/2000</div>
		</div>
		
		<div id="pay-wrap">
			<div class="register-title">결제</div>
			<div>
				<label class="pay-label">
					<input type="radio" name="pay" value="onionPay" checked="checked">
					<span>양파페이</span>
  				</label>
  				<label>
					<input type="radio" name="pay" value="money">
					<span>만나서 현금 결제</span>
				</label>
			</div>
		</div>
		<div id="btn-wrap">
			<button class="background-purple regi-btn">등록하기</button>
			<button type="button" class="background-gray regi-btn">취소</button>
		</div>
	</div>
</form>	

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/product/register.js"></script>
</body>
</html>