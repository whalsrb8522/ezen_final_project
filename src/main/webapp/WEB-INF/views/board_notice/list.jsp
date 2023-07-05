<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/resources/images/favicon.png">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board_notice/list.css">
<title>양파마켓 | 공지사항</title>
<style>

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
		
	
	<div id="container">
		
		<div id="inner-box">
		<span class="attachment-text">양파마켓</span> 
		<span class="attachment-text">>공지사항</span><br>
		</div>
	
		<div id="inner-box">
			<div id="second-inner">
				<h3>공지사항</h3>
				<div id="comment-btn">
					<a href="/board_notice/register"><button class="background-purple submit-button">등록하기</button></a>
				</div>
			</div>		
		</div>
		
		<div id="inner-box">
			<div id="searchBox" class="border-gray">
				<span id="searchIcon" class="material-symbols-outlined">search</span>
				<input type="text" id="searchInput">
			</div>
		</div>
		
		<div id="inner-box">
			<div id="notice">전체공지</div>			
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a href="/board_notice/detail"><span>7월, 고객센터 운영 시간 안내</span></a>
			</div>
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>개인정보처리방침 개정 안내 (2023.07.03)</span></a>
			</div>
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>서비스 이용약관 개정 안내 (2023.04.01)</span></a>
			</div>
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>양파마켓을 사칭하는 메시지, 조심하세요!</span></a>
			</div>	
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>모두보기 누르면 나올 것 1</span></a>
			</div>	
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>모두보기 누르면 나올 것 2</span></a>
			</div>	
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>모두보기 누르면 나올 것 3</span></a>
			</div>	
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>모두보기 누르면 나올 것 4</span></a>
			</div>	
		</div>
		
		<div id="showAll">
			<a><span>문서 모두보기</span></a>
		</div>
		
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

	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>