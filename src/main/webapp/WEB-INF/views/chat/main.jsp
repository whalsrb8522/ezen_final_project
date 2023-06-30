<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 메인</title>
<link rel="stylesheet" type="text/css" href="/resources/css/chat/main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 500,
  'GRAD' 0,
  'opsz' 48
}
</style>

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- 전체 채팅 리스트 및 채팅방을 감싸는 컨테이너 -->
	<div class="entireContainer">
		<div class="listContainer">
			<div class="listBox1">
				전체 대화 
				<span class="material-symbols-outlined">expand_more</span>
			</div>
			<div class="listBox2">
				<a>
					<img alt="프로필 사진" src="">
				</a>
				<div>닉네임</div>
				<div>오전 10:30</div>
			</div>
			
		</div>
		
		<div class="roomContainer">
			<div class="roomBox1">
				<span class="material-symbols-outlined">keyboard_backspace</span>
				<div>닉네임</div>
				<div>보통 10분 이내 응답</div>>
				<hr>
			</div>
			<div class="roomBox2">
				<a>
					<img alt="판매 상품 썸네일 사진" src="">
				</a>
				<span>거래중</span>
				<span>이케아 스탠드 판매합니다.</span>
				<span>18,000원</span>
				<hr>
				
			</div>
			<div class="roomBox3">
				<div class="myChat">
				
					<span>
						<p>안녕하세요 물건 구매하고 싶은데요</p>
					</span>
					<span>
						<div>보낸시간</div>
					</span>
				</div>
				<div class="yourChat">
					<a>
						<img alt="프로필 사진" src="">
					</a>
					<span>
						<p>네 안녕하세요</p>
					</span>		
					<span>
						<div>보낸시간</div>
					</span>	
				</div>
	
			</div>
			<div class="">
					<span class="material-symbols-outlined">add</span>	
					<div>
						<textarea rows="" cols="">메세지를 입력하세요</textarea>
					</div>
					<span class="material-symbols-outlined">send</span>
			</div>
	
	
	
	
	


		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>