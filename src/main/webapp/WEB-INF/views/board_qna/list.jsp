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
	    margin-bottom:40px;
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
	
	/*테이블*/
	#requests{
		font-size : 14px;
		margin-bottom: 40px;
	}
	
	.table-light thead {
   		background-color: #c97fe8;
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
			<h3>문의내역</h3>			
		</div>
		
		<div id="inner-box">
			<div id="searchBox" class="border-gray">
				<span id="searchIcon" class="material-symbols-outlined">search</span>
				<input type="text" id="searchInput" placeholder="　요청 검색">
			</div>
		</div>
		
		<div id="inner-box">
			<div id ="requests">
				<table class="table table-hover table-borderless">
					<thead class="table-light">
						<tr>
							<th>제목</th>
							<th>ID</th>
							<th>등록시간</th>
							<th>마지막활동</th>
							<th>상태</th>
						</tr>					
					</thead>
					<tbody>
						<tr>
							<td><a href="/board_qna/detail">의뢰문의</a></td>
							<td>mari</td>
							<td>2023.07.04</td>
							<td>몇 초 전</td>
							<td>답변 전</td>
						</tr>					
					</tbody>
				</table>
			</div>
		</div>
		
	</div>


	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>