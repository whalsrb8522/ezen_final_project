<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양파마켓 | 로그인</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/signin.css">
</head>
<body>
	<div id="container">
		<div id="innerContainer">
			<a href="/" id="logoContainer">
				<img alt="로고" src="/resources/img/logo.png" id="logoImage">
				<span id="logoText">양파마켓</span>
			</a>
			
			<form action="">
				<div>
					<input type="text" id="idInput" class="border-gray" placeholder="아이디">
					<input type="password" id="pwInput" class="border-gray" placeholder="비밀번호">
				</div>
				
				<button type="submit" id="subBtn" class="background-purple">로그인</button>
			</form>
			
			<a href="/member/signup" id="signupBtn">회원가입</a>
			
			<p id="signSnsText">SNS 계정으로 간편 로그인/회원가입</p>
			
			<div id="signSnsBtn">
				<p>F</p>
				<p>F</p>
				<p>F</p>
			</div>
		</div>
	</div>
</body>
</html>
