<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>header</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/nav.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<style>
	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 400,
	  'GRAD' 0,
	  'opsz' 48
	}
	</style>
</head>
<body>
	<header>
		<div id="headerContainer">
			<a id="logoContainer">
				<img alt="로고" src="/resources/img/logo.png" id="logoImage">
				<span id="logoText">양파마켓</span>
			</a>
			
			<div id="searchContainer" class="border-gray">
				<span id="searchIcon" class="material-symbols-outlined">
					search
				</span>
				<input type="text" id="searchInput">
			</div>
			
			<div id="memberContainer">
				<!-- 로그인 전 -->
				<!-- <a href="#">회원가입</a>
				<a href="#">로그인</a> -->
				
				<!-- 로그인 후 -->
				<a href="#">내 상점</a>
				<a href="#">로그아웃</a>
			</div>
		</div>
	</header>
	<nav>
		<div id="navContainer">
			네비입니다.
		</div>
	</nav>
</body>
</html>