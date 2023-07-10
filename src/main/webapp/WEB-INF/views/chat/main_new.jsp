<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양파마켓 | 채팅</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div id="container">
		<div id="chatContainer">
			<div id="chatContainerLeft">
				<h1>전체 대화</h1>
				<div id="chatRoomContainer">
					<div></div>
					<div>
						<div>
							<img>
						</div>
						<div></div>
					</div>
				</div>
			</div>
			
			<div id="chatContainerRight">
				오른쪽
			</div>
		</div>
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>