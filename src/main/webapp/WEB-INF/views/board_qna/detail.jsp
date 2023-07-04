<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 1:1문의하기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	  /*border-color: #c97fe8;*/	  
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
	  margin-top: 30px;
	  margin-bottom: 20px;
	}
	
	#inner-box:not(:first-child) {
	  margin-top: 5px;
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
    
    hr{
    	width:1024px;
    	margin: 0 auto;
    }
    
    /* 문의 내용*/
    	
	#writer-box {
	  display: flex;
	  align-items: center;
	  margin-bottom: 20px;
	  margin-top: 20px;
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
	  font-weight:700;
	}

	.reg_time {
	  color:#777;
	}
    
    #content-box{
      font-size:14px;
	  font-weight:700;  	
	  color:#333;
	  margin-bottom:30px;
    }
    
    /* 추가문의 */
    	
	#comment_box {
	  display: flex;
	  flex-wrap: wrap;
	  align-items: flex-start;
	  margin-top: 30px;
	  
	}
	
	#comment-info {
	  display: flex;
	  align-items: flex-start;
	  flex-grow: 1;
	  flex-basis: 0;
	}
	
	#writer-profile {
	  flex: 0 0 40px;
	  height: 40px;
	  border-radius: 50%;
	  overflow: hidden;
	  box-shadow: 0 0 2px #333333;
	}
	
	#writer-comment {
	  flex-grow: 1;
	  margin-left: 10px;
	}
	
	#comment-btn {
	  width: 100%;
	  display: flex;
	  justify-content: center;
	  margin-bottom: 10px;
	}
	
	.submit-button {
	  width: 100px;
	  height: 40px;
	  font-size: 16px;
	  border: 1px solid;
	  border-radius: 5px;
	}
	
	#comment{
		font-size: 14px;
		margin-bottom: 3px;
	}
    
    /*버튼*/
    .submit-button {
	  width: 100px; /* 버튼 가로 크기를 100px로 설정 */
	  height: 40px;
	  font-size: 16px;
	  border-radius: 5px;
	  border: none; 
	}



</style>	
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
		
	
	<div id="container">
		
		<div id="inner-box">
		<span class="attachment-text">양파마켓 고객센터</span> 
		<span class="attachment-text">>문의내역</span><br>
		</div>
	
		<div id="inner-box">
			<h3>제목가져오기</h3>			
		</div>
		
		<hr>
		
		<div id="inner-box">
			<div id="writer-box">
				<div id="writer-profile">
					<img src="/resources/images/basicprofile.jpeg" alt="Image">
				</div>
				<div id="writer-info">
					<div id="nick-info">
						<span class="nickname">글쓴이</span>
					</div>
					<div id="reg-info">
						<span class="reg_time">13:25</span>
					</div>
				</div>
			</div>
			<div id="content-box">
				<span>의뢰문의 방법 어쩌고 저쩌고 문의합니다.</span>
			</div>
		</div>
		
		<hr>
		
		<form>
		<div id="inner-box">
			<div id="comment_box" >
				<div id="comment-info">
					<div id="writer-profile">
						<img src="/resources/images/basicprofile.jpeg" alt="Image">
					</div>
					<div id="writer-comment">
		 				<textarea class="border-gray" id="loc-content" name="loc-content" 
		 				rows="7" maxlength="200" placeholder="문의 내용에 추가"></textarea>
					</div>
				</div>
				<div id="comment-btn">
					<a><button class="background-purple submit-button">제출</button></a>
				</div>
			</div>
		</div>
		</form>


		
	</div>


	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>