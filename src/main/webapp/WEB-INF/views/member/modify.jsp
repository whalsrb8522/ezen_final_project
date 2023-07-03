<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양파마켓 | 회원수정</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/modify.css">
	
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
		
			<h1>회원수정</h1>
			
			<div id="emailContainer">
				<h2>이메일</h2>
				<div id="emailInput">
					<input type="text" name="" class="border-gray input-box" placeholder="이메일" disabled="disabled">
				</div>
			</div>
			
			<div id="oldPasswordContainer">
				<h2>기존 비밀번호</h2>
				<h6>영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</h6>
				<input type="password" name="" class="border-gray input-box" placeholder="비밀번호">
			</div>			
			
			<div id="newPasswordContainer">
				<h2>변경 비밀번호</h2>
				<h6>영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</h6>
				<input type="password" name="" class="border-gray input-box" placeholder="비밀번호">
			</div>			
			
			<div id="newPasswordCheckContainer">
				<h2>변경 비밀번호 확인</h2>
				<input type="password" name="" class="border-gray input-box" placeholder="비밀번호 확인">
			</div>
			
			<div id="nickNameContainer">
				<h2>닉네임</h2>
				<h6>다른 유저와 겹치지 않도록 입력해주세요. (2~15자)</h6>
				<input type="text" class="border-gray input-box" placeholder="닉네임">
			</div>
			
			<div id="introduceContainer">
				<h2>자기 소개</h2>
				<textarea name="" class="border-gray textarea-box" placeholder="자기 소개를 입력해주세요."></textarea>
			</div>
			
			<div id="mapContainer">
				<h2>주소 선택</h2>
				<div style="display: flex;">
					<input type="text" id="mapAddress" class="border-gray input-box" placeholder="주소" disabled="disabled">
					<input type="button" onclick="execDaumPostcode()" id="mapBtn" class="background-purple" value="주소 검색"><br>
				</div>
				<div id="kakaoMap">
				</div>
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
					<label for="terms1">
						<input type="checkbox" name="terms" id="terms1" checked="checked" disabled="disabled">
						만 14세 이상입니다 (필수)
					</label>
					<label for="terms2">
						<input type="checkbox" name="terms" id="terms2" checked="checked" disabled="disabled">
						이용약관 (필수)
					</label>
					<label for="terms3">
						<input type="checkbox" name="terms" id="terms3" checked="checked" disabled="disabled">
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
					
			<button type="submit" id="submitBtn" class="background-purple">회원수정하기</button>
			
			<p align="center">이미 아이디가 있으신가요? <a href="/member/signin">로그인</a>
		</form>
	</div>
	
	<script type="text/javascript" src="/resources/js/member/signup.js"></script>
</body>
</html>