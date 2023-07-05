<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 1:1문의하기</title>
<link rel="icon" type="image/png" href="/resources/images/favicon.png">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board_qna/list.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>

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
							<th>상태</th>
						</tr>					
					</thead>
					<tbody>
						<tr>
							<td><a href="/board_qna/detail">의뢰문의</a></td>
							<td>mari</td>
							<td>2023.07.04</td>
							<td>답변 전</td>
						</tr>					
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="inner-box">
			<!-- 페이지네이션 -->
			<div id="page-wrap">
				<!-- 이전페이지 -->
				<div class="background-gray page-btn">&lt;</div>
				<!-- 컨트롤러에서 page 정보를 싣고 와야 함 -->
				<!-- 숫자 페이지 -->
				<div class="background-gray page-btn">i</div>
				<!-- 다음페이지 -->
				<div class="background-gray page-btn">&gt;</div>
			</div>
		</div>
		
	</div>


	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>