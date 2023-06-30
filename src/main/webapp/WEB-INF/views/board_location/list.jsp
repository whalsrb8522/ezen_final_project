<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board_location/list.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>양파마켓 | 지역게시판</title>
<style>

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>		
	<div id="container">
		
		<div id="inner-box">
		<span class="attachment-text">양파마켓 동네생활</span> 
		<span class="attachment-text">>양파타운</span><br>
		</div>
	
		<div id="inner-box">
			<div id="second-inner">
				<h3>동네생활</h3>
				<div id="comment-btn">
					<a href="/board_location/register"><button class="background-purple submit-button">글쓰기</button></a>
				</div>
			</div>		
		</div>
	
	
		<div id="inner-box">
			<!-- 카테고리 : 경아언니꺼 받아서 넣기 -->
			<div id="tmp-box"></div>
		</div>
		
		<div id="inner-box">
			<div id="third-inner">
				<div id="icon-box">
					<a href="#"><span class="material-symbols-outlined">refresh</span></a>
				</div>
				<div id="searchBox" class="border-gray">
					<span id="searchIcon" class="material-symbols-outlined">search</span>
					<input type="text" id="searchInput" placeholder=" 계양구 근처에서 검색">
				</div>
			</div>
		</div>

		<hr>
		<div id="inner-box">
		<div id="list-box">
			<div id="list-main">
				<span>동물병원 추천해주세요..</span>
			</div>
			<div id="list-info">
				<span>마리집사</span>
				<span>·</span>
				<span>13:25</span>
				<span>·</span>
				<span>조회수 3회</span>
			</div>
			<div id="list-icon">
				<span class="material-symbols-outlined">favorite</span>
				<span class="material-text">3</span>
				<span class="material-symbols-outlined">sms</span>
				<span class="material-text">1</span>
			</div>
		</div>			
		</div>			
		<hr>

		<div id="inner-box">
		<div id="list-box">
			<div id="list-main">
				<span>점심 메뉴 추천좀</span>
			</div>
			<div id="list-info">
				<span>마리집사</span>
				<span>·</span>
				<span>13:25</span>
				<span>·</span>
				<span>조회수 3회</span>
			</div>
			<div id="list-icon">
				<span class="material-symbols-outlined">favorite</span>
				<span class="material-text">3</span>
				<span class="material-symbols-outlined">sms</span>
				<span class="material-text">1</span>
			</div>
		</div>			
		</div>			
		<hr>
		
		<div id="inner-box">
		<div id="list-box">
			<div id="list-main">
				<span>초콜릿이 통째로! 칙촉! 촉촉한 초코칩은 가라</span>
			</div>
			<div id="list-info">
				<span>마리집사</span>
				<span>·</span>
				<span>13:25</span>
				<span>·</span>
				<span>조회수 3회</span>
			</div>
			<div id="list-icon">
				<span class="material-symbols-outlined">favorite</span>
				<span class="material-text">3</span>
				<span class="material-symbols-outlined">sms</span>
				<span class="material-text">1</span>
			</div>
		</div>			
		</div>			
		<hr>

		<div id="inner-box">
		<div id="list-box">
			<div id="list-main">
				<span>안녕히 계세요 여러부운~</span>
			</div>
			<div id="list-info">
				<span>마리집사</span>
				<span>·</span>
				<span>13:25</span>
				<span>·</span>
				<span>조회수 3회</span>
			</div>
			<div id="list-icon">
				<span class="material-symbols-outlined">favorite</span>
				<span class="material-text">3</span>
				<span class="material-symbols-outlined">sms</span>
				<span class="material-text">1</span>
			</div>
		</div>			
		</div>			
		<hr>



	</div>
		
</body>
</html>