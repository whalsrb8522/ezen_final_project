<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양파마켓 | 회원가입</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/signup.css">
	
	<!-- 구글 폰트 -->
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	
	<!-- 카카오 지도 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28524d982cffea013a5f7c234898c8df&libraries=services"></script>
</head>
<body>
	<div id="container">
		<form action="/member/signup" method="POST" id="innerContainer">
			<a href="/" id="logoContainer">	
				<img alt="로고" src="/resources/img/logo.png" id="logoImage">
				<span id="logoText">양파마켓</span>
			</a>
		
			<h1>회원가입</h1>
			
			<p id="signSnsText">SNS 계정으로 간편 로그인/회원가입</p>
			
			<div id="signSnsBtn">
				<p>F</p>
				<p>F</p>
				<p>F</p>
			</div>
			
			<div id="emailContainer">
				<h2>이메일</h2>
				<div id="emailInput">
					<input type="text" id="user_email" name="user_email" class="border-gray input-box" placeholder="이메일">
					@
					<select id="email_address" name="email_address" class="border-gray input-box">
						<option>선택해주세요</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="kakao.com">kakao.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
					
				</div>
				<input type="hidden" id="m_mail" name="m_mail">
				<button type="submit" id="emailBtn" class="background-gray">이메일 인증하기</button>
			</div>
			
			<div id="passwordContainer">
				<h2>비밀번호</h2>
				<h6>영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</h6>
				<input type="password" name="m_pw" class="border-gray input-box" placeholder="비밀번호">
			</div>			
			
			<div id="passwordCheckContainer">
				<h2>비밀번호 확인</h2>
				<input type="password" name="m_pw_check" class="border-gray input-box" placeholder="비밀번호 확인">
			</div>
			
			<div id="nickNameContainer">
				<h2>닉네임</h2>
				<h6>다른 유저와 겹치지 않도록 입력해주세요. (2~15자)</h6>
				<input type="text" class="border-gray input-box" placeholder="닉네임" name="m_nick_name">
			</div>
			
			<div id="introduceContainer">
				<h2>자기 소개</h2>
				<textarea name="m_introduct" class="border-gray textarea-box" placeholder="자기 소개를 입력해주세요."></textarea>
			</div>
			
			<div id="mapContainer">
				<h2>주소 선택</h2>
				<div style="display: flex;">
					<input type="text" id="mapAddress" class="border-gray input-box" placeholder="주소" disabled="disabled" name="m_address">
					<input type="hidden" id="m_address" name="m_address">
					<input type="button" onclick="execDaumPostcode()" id="mapBtn" class="background-purple" value="주소 검색"><br>
				</div>
				<div id="kakaoMap"></div>
			</div>
			
			<div id="imageContainer">
				<h2>프로필 사진</h2>
				<div style="display: flex;">
					<input type="text" id="imagePath" class="border-gray">
					<input type="button" id="imageChoose" class="background-purple" value="파일 선택">
				</div>
				<div id="imagePrint	"></div>
			</div>
			
			<div id="termsContainer">
				<h2>약관동의</h2>
				<div id="termsInnerContainer" class="border-gray">
					<label for="termsAll">
						<input type="checkbox" name="terms" id="termsAll" onClick="selectAll(this)">
						전체동의
					</label>
					<label for="terms1">
						<input type="checkbox" name="terms" id="terms1">
						만 14세 이상입니다 (필수)
					</label>
					<label for="terms2">
						<input type="checkbox" name="terms" id="terms2">
						이용약관 (필수)
					</label>
					<label for="terms3">
						<input type="checkbox" name="terms" id="terms3">
						개인정보수집 및 이용동의 (필수)
					</label>
					<label for="terms4">
						<input type="checkbox" name="terms" id="terms4">
						개인정보 마케팅 활용 동의 (선택)
					</label>
					<label for="terms5">
						<input type="checkbox" name="terms" id="terms5">
						이벤트, 쿠폰, 메일 및 SMS 등  수신 (선택)
					</label>
				</div>
			</div>
			
			<div class="g-recaptcha" data-sitekey="6LeSzuEmAAAAAFNAFoHpVpKIeLw6Iso_AI757aeh"></div>
			
			<button type="submit" id="submitBtn" class="background-purple">회원가입하기</button>
			
			<p align="center">이미 아이디가 있으신가요? <a href="/member/signin">로그인</a>
		</form>
	</div>
	
	<script type="text/javascript" src="/resources/js/member/signup.js"></script>
</body>
</html>