<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 채팅메인 </title>
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
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
	<div class="bodyPage">
		<div class="entireContainer">
			<div class="Container">
				<div class="listContainer">
					<div class="listContainer1">
						<div class="listContainer2">
						
							<div class="listBox">
								<div class="listBox1">
									<div class="listBox2">
										전체 대화 
										<span class="material-symbols-outlined">expand_more</span>
									</div>
								</div>
							</div>
							
							<div class="chatList">
								<a class="chatList1">
									<div class="chatList2">
										<div class="chatList3">
											<img alt="" src="" class="chatListImg">
										</div>
									
									</div>
								</a>
								
								<div class="chatListText">
									<div class="chatListText1">
										<div class="chatListText2">
											<strong class="chatListText3">닉네임</strong>
										</div>
										<div class="chatListText4">
											<div class="chatListText5">
												<div class="chatListText6">마지막 메세지</div>
												<div class="chatListText7">
													&nbsp;・&nbsp;
													대화 시간
												</div>
											</div>
										</div>
									</div>
								
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="roomContainer">
					<div class="roomContainer1">
						<div class="roomTopBox">
							<span class="material-symbols-outlined" id="TopBoxIcon">keyboard_backspace</span>
							<div class="roomTopBox3">
								<div class="roomTopBox-nick">닉네임</div>
								<div class="roomTopBox-time">평균 응답 시간</div>
							</div>
						</div>
						
						<hr style="margin-bottom: 20px;">
						
						<div class="roomMidBoxEx">
							<img alt="" src="" class="item-image">
							<div class="item-info">
								<span class="trade-status">거래중</span>
								<span class="price">18,000원</span>
							</div>	
								<span class="trade-title">이케아 스탠드 판매합니다.</span>
						</div>
						
						<hr style="margin-top: 20px;">
						
						<div class="roomMidBox">
							<div class="roomMidBox1">
								<div class="roomMidBoxChat">
									<div class="roomMidBoxChat1">
										<span class="roomMidBoxChat2">채팅 날짜</span>
										<hr class="roomMidBoxChat3">
									</div>
								</div>
								<div class="roomMidBoxChat4">
									<span class="myChat">대화대화대화대화대화</span>
									<span class="myChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
								<div class="roomMidBoxChat5">
									<img alt="" src="">
									<span class="yourChat">대화대화대화대화대화</span>
									<span class="yourChatTime">대화 시간</span>
								</div>
							</div>
						</div>
						<div class="roomBotBox">
							<div class="roomBotBox1">
								<div class="roomBotBox2">
									<span class="material-symbols-outlined">add</span>
								</div>
								
								

				
								<div class="roomBotBox3">
									<div class="roomBotBox4">
										<textarea rows="" cols="" placeholder="메세지를 입력하세요" class="roomBotBoxText"></textarea>
									</div>
									<div class="roomBotBoxBtn">
										<span class="material-symbols-outlined">send</span>
									</div>
								</div>
							</div>
						</div>
		
		
		
		
							
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<jsp:include page="../chat/modal.jsp"></jsp:include>
	
</body>
</html>
