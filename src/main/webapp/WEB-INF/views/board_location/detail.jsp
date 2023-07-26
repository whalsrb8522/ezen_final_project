<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board_location/detail.css">
<link rel="icon" type="image/png" href="/resources/image/favicon.png">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>양파마켓 | 지역게시판</title>
<style>

</style>	
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>		
	
	<div id="container">	
	
		<div id="inner-box">
			<span class="attachment-tag">동네질문</span> 
		</div>
		
		<div id="inner-box">
			<div id="writer-box">
				<div id="writer-profile">
					<img src="/resources/image/cat.jpg" alt="Image">
				</div>
				<div id="writer-info">
					<div id="nick-info">
						<span class="nickname">마리집사</span>
					</div>
					<div id="reg-info">
						<span class="reg_location">계양구</span>
						<span class="reg_dot">·</span>
						<span class="reg_time">13:25</span>
					</div>
				</div>
			</div>
		</div>
		
		<div id="inner-box">
			<span class="loc-title">동물병원 추천해주세요..</span> 
		</div>
		
		<div id="inner-box">
			<span class="loc-content">
				안녕하세요. 15살 페르시안 친칠라 집사입니다.<br>
				만성 신부전증이 있어서 큰 병원에서 정기검진이 필요합니다.<br>
				괜찮은 병원이 있다면 정보 공유 부탁드립니다.
			</span> 
		</div>
				
		<hr>		
		<div id="inner-box">
			<div id="icon-box">
				<a href="#">
					<span class="material-symbols-outlined">
					favorite
					</span>
				</a>
				<span class="material-text">공감하기</span>
				<span class="material-text">1</span>
				<a href="#">
					<span class="material-symbols-outlined">
					sms
					</span>
				</a>
				<span class="material-text">댓글</span>
				<span class="material-text">1</span>
			</div>
		</div>			
		<hr class="last_hr">
		
		<div id="inner-box">
		<div id="writer-container">
			<div id="writer-box2">
				<div id="writer-profile">
					<img src="/resources/image/cat2.png" alt="Image">
				</div>
				<div id="writer-info">
					<div id="nick-info">
						<span class="nickname">하하하하하하하하하하</span>
					</div>
					<div id="reg-info">
						<span class="reg_location">계양구</span>
						<span class="reg_dot">·</span>
						<span class="reg_time">14:23</span>
					</div>
				</div>
			</div>
			<div id="comment">SKY 동물병원 규모가 좀 커요!</div>
		</div>
		</div>
	
		<form>
		<div id="inner-box">
			<div id="comment-box" class="border-gray" >
				<div id="comment-info">
					<div id="writer-profile">
						<img src="/resources/image/cat2.png" alt="Image">
					</div>
					<div id="writer-comment">
		 				<textarea class="border-gray" id="loc-content" name="loc-content" 
		 				rows="4" maxlength="200" placeholder="내용을 입력해주세요"></textarea>
					</div>
				</div>
				<div id="comment-btn">
					<a><button class="background-purple submit-button">댓글쓰기</button></a>
				</div>
			</div>
		</div>
		</form>
		
		<div id="inner-box">
		  <div class="button-container">
		    <a href="/board_location/modify"><button class="background-gray submit-button">수정</button></a>
		    <a href="#"><button class="background-gray cancel-button submit-button">삭제</button></a>
		  </div>
		</div>
		
		
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>