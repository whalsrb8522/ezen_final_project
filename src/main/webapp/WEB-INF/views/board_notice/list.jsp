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
	
	#searchBox #searchInput:focus {
		outline: none;
	}
	
	/*체크 아이콘 상하 여백 조정 */
	#inner-box div span.material-symbols-outlined:first-child {
 	 display: inline-block;
	 vertical-align: middle;
 	 margin-bottom: 3px;
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
			<h3>공지사항</h3>			
		</div>
		
		<div id="inner-box">
			<div id="searchBox" class="border-gray">
				<span id="searchIcon" class="material-symbols-outlined">search</span>
				<input type="text" id="searchInput">
			</div>
		</div>
		
		<div id="inner-box">
			<span>전체공지</span>			
			<div>
				<span class="material-symbols-outlined">check_circle</span>
				<span>7월, 고객센터 운영 시간 안내</span>
			</div>
			<div>
				<span class="material-symbols-outlined">check_circle</span>
				<span>7월, 고객센터 운영 시간 안내</span>
			</div>
			<div>
				<span class="material-symbols-outlined">check_circle</span>
				<span>7월, 고객센터 운영 시간 안내</span>
			</div>
		</div>

		
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>