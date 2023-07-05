<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="icon" type="image/png" href="/resources/img/favicon.png">
	<link rel="stylesheet" type="text/css" href="/resources/css/layout/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/layout/nav.css">
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
			<a href="/" id="logoContainer">
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
				<a href="/member/signup">회원가입</a>
				<a href="/member/signin">로그인</a>
				 
				<!-- 로그인 후 -->
				<!-- 
				<a href="/member/detail">내 상점</a>
				<a href="/member/signout">로그아웃</a>
				 -->
			</div>
		</div>
	</header>
	<nav>
		<div id="navContainer">
			<span class="material-symbols-outlined">
				menu
			</span>
			<div id="menuContainer">
				<a href="/board_location/list">양파타운</a>
				<a href="/board_qna/register">1:1문의</a>
				<a href="/board_notice/list">공지사항</a>
			</div>
		</div>
	</nav>
</body>
</html>
