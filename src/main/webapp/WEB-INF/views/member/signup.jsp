<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/signup.css">
</head>
<body>
	<div id="container">
		<div id="innerContainer">
			<h1>회원가입</h1>
			
			<p id="signSnsText">SNS 계정으로 간편 로그인/회원가입</p>
			
			<div id="signSnsBtn">
				<p>F</p>
				<p>F</p>
				<p>F</p>
			</div>
			
			<div id="emailContainer">
				<h2>이메일</h2>
				<div>
					<input type="text" class="border-gray">
					@
					<select class="border-gray">
						<option>선택해주세요</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>kakao.com</option>
						<option>gmail.com</option>
					</select>
				</div>
				
				<button class="background-gray">이메일 인증하기</button>
			</div>
			
			<div id="passwordContainer">
				<h2>비밀번호</h2>
				<p>영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</p>
				<input type="password" class="border-gray" placeholder="비밀번호">
			</div>			
			
			<div id="passwordCheckContainer">
				<h2>비밀번호 확인</h2>
				<input type="password" class="border-gray" placeholder="비밀번호 확인">
			</div>
			
			<div id="nickNameContainer">
				<h2>닉네임</h2>
				<p>다른 유저와 겹치지 않도록 입력해주세요. (2~15자)</p>
				<input type="text" class="border-gray" placeholder="닉네임">
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
		</div>
	</div>
	
	<script type="text/javascript" src="/resources/js/checkboxSelectAll.js"></script>
</body>
</html>