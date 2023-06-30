<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<title>양파마켓 | 지역게시판</title>
<style>
	#container {
	  margin-top: 20px;
	  margin-bottom :50px;
	}
	
	#inner-box {
	  width: 1024px;
	  margin: 0 auto;
	  margin-bottom:20px;
	}
	
	.background-purple {
    background-color: #C97FE8;
    color: white;
  	}
  	
  	 .border-gray {
	  width: 100%;
	  box-sizing: border-box;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  padding: 6px 12px;
	  font-size: 14px;
	  margin-bottom: 15px; /* 여백 추가 */
	}
  	
  	.submit-button {
	  width: 100px; /* 버튼 가로 크기를 100px로 설정 */
	  height: 40px;
	  font-size: 16px;
	  border: 1px solid ;
	  border-radius: 5px;
	}
  	
	.attachment-tag {
	  display: inline-block;
	  width: 70px;
	  height: 20px;
	  background-color: #eee;
	  color:#666;
	  text-align: center;
	  line-height: 20px;
	  font-size: 10px;
	  border-radius: 4px;
	}
	
	#writer-box {
	  display: flex;
	  align-items: center;
	}
	
	#writer-profile {
	  width: 40px;
	  height: 40px;
	  border-radius: 50%;
	  overflow: hidden;
	  box-shadow: 0 0 2px #333333;
	}
	
	#writer-profile img {
	  width: 100%;
	  height: 100%;
	  object-fit: cover;
	}
	
	#writer-info {
	  display: flex;
	  flex-direction: column;
	  margin-left: 10px;
	  font-size: 12px;
	}
	
	.nickname {
	  margin-bottom: 5px;
	}
	
	#reg-info {
	  display: flex;
	  align-items: baseline;
	}
	
	.reg_location {
	  margin-right: 5px;
	}
	
	.reg_time {
	  margin-left: 5px;
	}
	
	.loc-title{
		font-size:18px;
		font-weight:700;
	}
	
	.loc-content{
		font-size:14px;
		margin-bottom:40px;
	}
	
	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 300,
	  'GRAD' 0,
	  'opsz' 30
	  vertical-align: middle;
	  display: inline-flex;
	  align-items: center;
	  font-size: 20px;
	  margin-top: 5px;
	}
	
	.material-text{
		font-size:14px;
	}
	
	.last_hr{
		margin-bottom:30px
	}
	
	<!--코멘트-->
	
	#comment_box {
  display: flex;
  align-items: center;
}

#comment_box #writer-profile {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  overflow: hidden;
  box-shadow: 0 0 2px #333333;
  margin-right: 10px;
}

#comment_box .writer-comment {
  flex-grow: 1;
}


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
					<img src="/resources/images/cat.jpg" alt="Image">
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
			<span class="material-symbols-outlined">
				favorite
			</span>
			<span class="material-text">공감하기</span>
			<span class="material-symbols-outlined">
			sms
			</span>
			<span class="material-text">댓글</span>
			<span class="material-text">1</span>
		</div>			
		<hr class="last_hr">
		
		<div id="inner-box">
			<div id="writer-box">
				<div id="writer-profile">
					<img src="/resources/images/cat2.png" alt="Image">
				</div>
				<div id="writer-info">
					<div id="nick-info">
						<span class="nickname">하하하</span>
					</div>
					<div id="reg-info">
						<span class="reg_location">계양구</span>
						<span class="reg_dot">·</span>
						<span class="reg_time">14:23</span>
					</div>
				</div>
			</div>
		</div>
		
		<div id="inner-box">
			<div id="comment_box" class="border-gray" >
				<div id="writer-profile">
					<img src="/resources/images/cat2.png" alt="Image">
				</div>
				<div class="writer-comment">
	 				<textarea class="border-gray" id="loc-content" name="loc-content" 
	 				rows="4" maxlength="200" placeholder="내용을 입력해주세요"></textarea>
				</div>
				<button class="background-purple submit-button">댓글쓰기</button>
			</div>
		</div>
		
	</div>
	
	
</body>
</html>