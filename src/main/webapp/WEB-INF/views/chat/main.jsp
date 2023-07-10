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
								<div class="chatList">
									<div class="chatListImg">
										<img alt="프로필" src="">
									</div>
									<div class="chatListText">
										<div class="chatListTextUp">${cdto.mvo.m_nick_name }</div>
										<div class="chatListTextDown">
											<c:choose>
												<c:when test="${cdto.lastCmvo eq null }">
													대화 내용이 없습니다.
												</c:when>
												<c:otherwise>
													${cdto.lastCmvo.cm_context }
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
					<div class="roomSelect">
						<p>대화를 선택해주세요.</p>
					</div>
					
					<div class="roomContainer1">
						<div class="roomTopBox">
							<span class="material-symbols-outlined" id="TopBoxIcon">keyboard_backspace</span>
							<div class="roomTopBox3">
								<div class="roomTopBox-nick">닉네임</div>
								<div class="roomTopBox-time">평균 응답 시간</div>
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
						
						<div class="roomMidBox">
							<div class="sendMessage">
								<div class="chatMessage">
									대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화대화
								</div>
								<div class="chatTime">
									00:00
								</div>
							</div>
							<div class="receiveMessage">
								<div class="chatMessage">
									대화대화대화대화대화
								</div>
								<div class="chatTime">
									00:00
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
