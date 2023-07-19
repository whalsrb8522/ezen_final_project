<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
			<form action="/product/list">
				<div id="searchContainer" class="border-purple">
					<span id="searchIcon" class="material-symbols-outlined">
						search
					</span>
					<input type="text" name="keyword" id="searchInput">
				</div>
			</form>
			<c:if test="${ses.m_mail eq null}">
				<!-- 로그인 전 -->
				<div id="memberContainer">
						<a href="/member/signup">회원가입</a>
						<a href="/member/signin">로그인</a>
				</div>
			</c:if>
			
			<c:if test="${ses.m_mail ne null}">
				<!-- 로그인 후 -->
				<div id="memberContainer1">
						<a href="/member/detail">내 상점</a>
						<a href="/chat/main">채팅방</a>
						<a href="/member/signout">로그아웃</a>
				</div>
			</c:if>
		</div>
			

		
	</header>
	<nav>
		<div id="navContainer">
			<ul class="menu">
			<li>
			<a href="#" class="material-symbols-outlined">
				menu
			</a>
			<ul class="depth_1">
		      <li><a href="#">강화군</a></li>
		      <li><a href="#">옹진군</a></li>
		      <li><a href="#">중구</a></li>
		      <li><a href="#">동구</a></li>
		      <li><a href="#">미추홀구</a></li>
		      <li><a href="#">연수구</a></li>
		      <li><a href="#">남동구</a></li>
		      <li><a href="#">부평구</a></li>
		      <li><a href="#">계양구</a></li>
		      <li><a href="#">서구</a></li>
		    </ul>
		    </li>
			</ul>
			<div id="menuContainer">
				<a href="/board_location/list">양파타운</a>
				<img src="/resources/img/new.png" width="72" height="26" alt="양파타운">
				<a href="/board_qna/register">1:1문의</a>
				<a href="/board_notice/list">공지사항</a>
			</div>
		</div>
	</nav>
</body>
</html>
