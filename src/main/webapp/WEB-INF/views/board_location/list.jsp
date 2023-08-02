<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/resources/image/favicon.png">
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
					<c:if test="${ses.m_number ne null }">
						<a href="/board_location/register"><button class="background-purple submit-button">글쓰기</button></a>
					</c:if>
				</div>
			</div>		
		</div>
	
	
		<div id="inner-box">
			<!-- 카테고리 : 경아언니꺼 받아서 넣기 -->
			<div id="cate-wrap">
				<span><b>카테고리</b></span><br><br>
			
			<div class="border-gray category">강화군</div>
			<div class="border-gray category">옹진군</div>
			<div class="border-gray category">중구</div>
			<div class="border-gray category">동구</div> <br>
			<div class="border-gray category">미추홀구</div>
			<div class="border-gray category">연수구</div>
			<div class="border-gray category">남동구</div>
			<div class="border-gray category">부평구</div>
			<div class="border-gray category">계양구</div>
			<div class="border-gray category">서구</div>
			<br>
			</div>
		</div>

		
		<div id="inner-box">
			<div id="third-inner">
				<div id="icon-box">
					<a href="#"><span class="material-symbols-outlined">refresh</span></a>
				</div>
				<div id="searchBox" class="border-gray2">
					<span id="searchIcon" class="material-symbols-outlined">search</span>
					<input type="text" id="searchInput" placeholder=" 계양구 근처에서 검색">
				</div>
			</div>
		</div>

		<hr>
		<div id="inner-box">
		<a href="/board_location/detail">
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
		</a>			
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
		<hr><br>
		
		<div id="inner-box">
			<!-- 페이지네이션 -->
			<div id="page-wrap">
				<!-- 이전페이지 -->
				<div class="background-gray page-btn">&lt;</div>
				<!-- 컨트롤러에서 page 정보를 싣고 와야 함 -->
				<!-- 숫자 페이지 -->
				<div class="background-gray page-btn">i</div>
				<!-- 다음페이지 -->
				<div class="background-gray page-btn">&gt;</div>
			</div>
		</div>
		

	</div>
		
</body>
</html>