<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 지역게시판</title>
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board_location/register.css">
<style>
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>		
	<div id="container">
		
		<div id="inner-box">
		<span class="attachment-text">양파마켓 동네생활</span> 
		<span class="attachment-text">>글쓰기</span><br>
		</div>
	
		<div id="inner-box">
			<h3>글쓰기</h3>			
		</div>
		
		<form>
		<div id="inner-box">
			<div class="loc-select"><label for="loc-select">주제</label></div>
			<select name="qna" id="loc-select" class="border-gray">
			    <option value="">주제를 선택해주세요</option>
			    <option value="report">동네질문</option>
			    <option value="account">동네사건사고</option>
			    <option value="onionPay">분실/실종센터</option>
			    <option value="error">생활정보</option>
			    <option value="etc">해주세요</option>
			</select>
		</div>
		
		<div id="inner-box">
			<div class="loc-content"><label for="loc-content">제목</label></div>
 			<input class="border-gray" id="loc-content" name="loc-content"
 			placeholder="제목을 입력해주세요"></textarea>
		</div>		
		
		<div id="inner-box">
			<div class="loc-content"><label for="loc-content">본문</label></div>
 			<textarea class="border-gray" id="loc-content" name="loc-content" 
 			rows="20" maxlength="300" placeholder="우리 동네 관련된 질문이나 이야기를 해보세요."></textarea>
		</div>		
		
		<div id="inner-box">
			<span>사진첨부(0/5)</span><br>
			<span class="attachment-text">사진을 첨부하면 정확한 답변을 받을 수 있어요</span><br>
			<div class="file-container">
			  <div class="file-box">
			  	<form action="" method="post" enctype="multipart/form-data">
		            <input type="file" name="qna">
       			</form>
			  </div>
			  <div class="file-box"></div>
			  <div class="file-box"></div>
			  <div class="file-box"></div>
			  <div class="file-box"></div>
			</div>	
		</div>
		
		<div id="inner-box">
		  <div class="button-container">
		    <button class="background-purple submit-button">제출</button>
		    <button class="background-gray cancel-button submit-button">취소</button>
		  </div>
		</div>
				
		</form>
		
	</div>
	
	
	
	
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>