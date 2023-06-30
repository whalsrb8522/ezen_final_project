<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 1:1문의하기</title>
	<style>
	#container {
	  margin-top: 20px;
	  margin-bottom :50px;
	}
	
	#inner-box {
	  width: 1024px;
	  margin: 0 auto;
	}
	
	.qna-select, .qna-content {
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
    background-color: purple;
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

 	 .submit-button {
    width: 100%;
    height: 40px;
    font-size: 16px;
 	}
  	 		
	</style>
	
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board_qna_register.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
		
	
	<div id="container">
		
		<div id="inner-box">
		<span class="attachment-text">양파마켓 고객센터</span> 
		<span class="attachment-text">>1:1문의</span><br>
		</div>
	
		<div id="inner-box">
			<h3>1:1문의하기</h3>			
		</div>
		
		<form>
		<div id="inner-box">
			<div class="qna-select"><label for="qna-select">유형선택</label></div>
			<select name="qna" id="qna-select" class="border-gray">
			    <option value="">유형을 선택해주세요</option>
			    <option value="report">거래신고</option>
			    <option value="account">회원/계정</option>
			    <option value="onionPay">양파페이(안전결제)</option>
			    <option value="error">오류/신고/제안</option>
			    <option value="etc">기타</option>
			</select>
		</div>
		
		<div id="inner-box">
			<div class="qna-content"><label for="qna-content">문의 내용</label></div>
 			<textarea class="border-gray" id="qna-content" name="qna-content" 
 			rows="10" maxlength="300" placeholder="문의할 내용을 자세히 입력해주세요"></textarea>
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
		<button class="background-purple submit-button">제출</button>
		</div>
		
		</form>
		
	</div>
	
	
	
	
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>