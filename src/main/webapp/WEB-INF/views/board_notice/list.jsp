<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<title>양파마켓 | 공지사항</title>
<style>
	#container {
	  margin-top: 20px;
	  margin-bottom :50px;
	}
	
	#inner-box {
	  width: 1024px;
	  margin: 0 auto;
	 
	}
	
	.submit-button {
	  width: 100px;
	  height: 40px;
	  font-size: 16px;
	  border: 1px solid ;
	  border-radius: 5px;
	}
	
	#second-inner {
	  display: flex;
	  justify-content: space-between;
	  align-items: center;
	  margin : 10px 0 20px 0;
	}
	
	#inner-box h3 {
	  margin: 0;
	}
	
	#comment-btn {
	  display: flex;
	  align-items: center;
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
	  margin-top: 15px;
	  margin-bottom: 30px;
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
    
    /* 검색 관련 */
	#searchBox {
	    height: 30px;
	    width: 500px;
	    display: flex;
	    justify-content: space-between;
	    overflow: hidden;
	    margin-top:4px;
	}
	
	#searchBox #searchIcon {
	    width: 33px;
	    height: 33px;
	    color: white;
	    background-color: #ccc;
	    text-align: center;
	    line-height: 33px;
	    margin-top: -8px;
	    margin-left: -12px;
	}
		
	#searchBox #searchInput {
	    border: none;
 		width: 100%;
 		margin-left: 0;
	} 
	
	#searchBox #searchInput:focus {
		outline: none;
	}	
	
	/*체크 아이콘 상하 여백 조정 */
	#inner-box div span.material-symbols-outlined {
  	  display: inline-block;
	  vertical-align: middle;
 	  margin-bottom: 3px;
 	  color: #c97fe8;
 	  font-variation-settings:
	  'FILL' 1,
	  'wght' 400,
	  'GRAD' 0,
	  'opsz' 48
	}
		
	#notice {
	  font-size: 18px;
	  margin : 20px 0;
	  font-weight :700;
	  color : #666;
	}
	
	#not-title{
		margin-bottom: 30px;
		font-weight :700;
		color : #888;
	}
	
	/*문서 모두보기*/
	#showAll{
	  width: 1024px;
	  margin: 30px auto;
	}
	
	#showAll span{
	  font-size : 14px;
	  font-weight :700;
	  color : #666;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
		
	
	<div id="container">
		
		<div id="inner-box">
		<span class="attachment-text">양파마켓</span> 
		<span class="attachment-text">>공지사항</span><br>
		</div>
	
		<div id="inner-box">
			<div id="second-inner">
				<h3>공지사항</h3>
				<div id="comment-btn">
					<a href="/board_notice/register"><button class="background-purple submit-button">등록하기</button></a>
				</div>
			</div>		
		</div>
		
		<div id="inner-box">
			<div id="searchBox" class="border-gray">
				<span id="searchIcon" class="material-symbols-outlined">search</span>
				<input type="text" id="searchInput">
			</div>
		</div>
		
		<div id="inner-box">
			<div id="notice">전체공지</div>			
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>7월, 고객센터 운영 시간 안내</span></a>
			</div>
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>개인정보처리방침 개정 안내 (2023.07.03)</span></a>
			</div>
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>서비스 이용약관 개정 안내 (2023.04.01)</span></a>
			</div>
			<div id="not-title">
				<span class="material-symbols-outlined">check_circle</span>
				<a><span>양파마켓을 사칭하는 메시지, 조심하세요!</span></a>
			</div>	
		</div>
		
		<div id="showAll">
			<a><span>문서 모두보기</span></a>
		</div>
		
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>