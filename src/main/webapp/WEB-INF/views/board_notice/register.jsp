<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 지역게시판</title>
<link rel="icon" type="image/png" href="/resources/images/favicon.png">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board_location/register.css">
<style>
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>		
	<div id="container">
		
		<div id="inner-box">
		<span class="attachment-text">양파마켓 공지사항</span> 
		<span class="attachment-text">>등록</span><br>
		</div>
	
		<div id="inner-box">
			<h3>공지사항 등록</h3>			
		</div>
		
		<form>
		<div id="inner-box">
			<div class="loc-content"><label for="loc-content">제목</label></div>
 			<input class="border-gray" id="loc-content" name="loc-content"
 			placeholder="제목을 입력해주세요"></textarea>
		</div>		
		
		<div id="inner-box">
			<div class="loc-content"><label for="loc-content">본문</label></div>
 			<textarea class="border-gray" id="loc-content" name="loc-content" 
 			rows="20" maxlength="300" placeholder="공지사항 내용을 입력해주세요."></textarea>
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
		    <a href="/board_notice/list"><button class="background-purple submit-button">등록</button></a>
		    <a href="/board_notice/list"><button class="background-gray cancel-button submit-button">취소</button></a>
		  </div>
		</div>
				
		</form>
		
	</div>
	
	
	
	
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>