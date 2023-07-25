<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<!-- 전체 채팅 리스트 및 채팅방을 감싸는 컨테이너 -->
	<div class="bodyPage">
		<div class="entireContainer">
			<div class="Container">
				<div class="listContainer">
					<div class="listContainer1">
						<div class="listBox">
							전체 대화	 
						</div>
						
						<!-- 채팅방 목록 -->
						<div class="chatListContainer">
							<c:forEach items="${listCdto }" var="cdto">
									<div class="chatList" onclick="getChat(${cdto.crvo.cr_number })">
										<div class="chatListImg">
											<img alt="프로필" src="">
										</div>
										<div class="chatListText">
											<div class="chatListTextUp">
												<c:choose>
													<c:when test="${cdto.senderMvo.m_number eq ses.m_number }">
														${cdto.receiverMvo.m_nick_name }
													</c:when>
													<c:otherwise>
														${cdto.senderMvo.m_nick_name }
													</c:otherwise>
												</c:choose>
											</div>
											<div class="chatListTextDown">
												<c:choose>
													<c:when test="${cdto.lastMessage eq null }">
														대화 내용이 없습니다.
													</c:when>
													<c:otherwise>
														${cdto.lastMessage }
													</c:otherwise>
												</c:choose>
											</div>
										</div>								
									</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="roomContainer">
					<div id="chatDisplayNone">
						<p>대화를 선택해주세요.</p>
					</div>
					
					<div class="roomContainer1">
						<div class="roomTopBox">
							<span class="material-symbols-outlined" id="backBtn">keyboard_backspace</span>
							<div class="roomTopBox3">
								<div class="roomTopBox-nick">닉네임</div>
							</div>
						</div>
						
						<div class="roomMidBoxEx">
							<img alt="" src="" class="item-image">
							<div class="item-info">
								<span class="trade-status">거래중</span>
								<span class="price">18,000원</span>
							</div>	
								<span class="trade-title">이케아 스탠드 판매합니다.</span>
						</div>
						
						<div id="roomMidBox">
							<div class="sendMessage">
								<div class="chatMessage">
									대화내용
								</div>
								<div class="chatTime">
									00:00
								</div>
							</div>
							<div class="receiveMessage">
								<div class="chatMessage">
									대화내용
								</div>
								<div class="chatTime">
									00:00
								</div>
							</div>
						</div>
						
						<div id="roomBotBox">
							<div id="roomInputBox">
								<span id="modalBtn" class="material-symbols-outlined">add</span>
								<div id="roomInputRight">
									<input type="text" id="chatInput" placeholder="메시지를 입력해주세요." onKeypress="javascript:if(event.keyCode==13) {sendMessage()}">
									<span id="chatSendBtn" class="material-symbols-outlined" onclick="sendMessage()">send</span>
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
<script type="text/javascript">
	var sessionMemberNumber = '<c:out value="${ses.m_number }"></c:out>';
	var selectRoomNumber = '<c:out value="${selectRoomNumber }"></c:out>';
</script>
<script type="text/javascript" src="/resources/js/chat/chat.js"></script>
</html>
