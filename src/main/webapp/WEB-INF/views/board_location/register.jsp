<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 지역게시판</title>
<style>
	#container {
	  margin-top: 20px;
	  margin-bottom :50px;
	}
	
	#inner-box {
	  width: 1024px;
	  margin: 0 auto;
	}
	
	.loc-select, .loc-content {
	    margin-bottom: 8px;
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
	
	select.border-gray:focus {
	  outline: none;
	  border-color: #c97fe8;	  
	}
	
	select.border-gray optgroup {
	  padding-top: 10px;
	  padding-bottom: 10px;
	}
	
	select.border-gray option {
	  padding-top: 10px;
	  padding-bottom: 10px;
	}
	
	#inner-box h3 {
	  font-size : 26px;
	  margin-top: 15px;
	  margin-bottom: 30px;
	}
	
	#inner-box:not(:first-child) {
	  margin-top: 5px;
	}
	  
	.file-container {
 	  display: flex;
	  justify-content: space-between;
	  margin-top:20px;
	  margin-bottom:40px;
	 }

 	 .file-box {
	    position: relative;
	    width: 180px;
	    height: 180px;
		border: 1px solid #ccc;
		border-radius: 4px;
  	}

	  .file-box::after {
	    content: "+";
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    font-size: 30px;
	    color: #ccc;
	  }
	
	.background-purple {
    background-color: #C97FE8;
    color: white;
  	}
  	
  	.attachment-text {
    color: #666666;
    font-size: 12px;
 	}
 	
 	.attachment-text:first-child {
    color: #C97FE8;
    font-size: 12px;
    font-weight:700;
 	}
 	
    .attachment-text:nth-child(2) {
      font-size: 12px;
      font-weight: 700;
    }
    
    
	<!-- 버튼 -->

	#inner-box {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-wrap: wrap;
	}
	
	.button-container {
	  display: flex;
	  justify-content: center;
	  width: 100%; /* 가로 폭을 100%로 설정 */
	  margin-top: 20px;
	  gap: 20px; /* 버튼 사이에 30px의 여백 추가 */
	}
	
	.submit-button {
	  width: 100px; /* 버튼 가로 크기를 100px로 설정 */
	  height: 40px;
	  font-size: 16px;
	  border: 1px solid ;
	  border-radius: 5px;
	}
	
	.cancel-button {
	  border: none; /* 테두리 없음 */
	}
	

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
			  <div class="file-box"></div>
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