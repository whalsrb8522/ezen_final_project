<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 1:1문의하기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board_notice/detail.css">
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
			<h3>제목가져오기</h3>			
			<div id="content-box">
				<span>3월 23일(목), 전자책 서비스 등록 기능이 업데이트되었습니다.</span><br>
				<span>상세한 내용은 아래의 안내를 참고해 주세요.</span><br>
				<h3>업데이트 일자 : 2023년 3월 23일(목)</h3>
				<h3>업데이트 항목 :</h3>
				<span>1. 요약 설명 기능 추가</span><br>
				<span>의뢰인의 구매 결정에 도움을 주는 정보를 제공할 수 있는 기능입니다.</span><br>
				<span>아래 3가지 테마 중 하나를 선택하여 전자책의 핵심 내용을 설명해 주세요.</span><br><br>
				<span>2. 상세이미지 보기 기능 추가</span><br>
				<span>의뢰인의 구매 결정에 도움을 주는 정보를 제공할 수 있는 기능입니다.</span><br>
				<span>아래 3가지 테마 중 하나를 선택하여 전자책의 핵심 내용을 설명해 주세요.</span><br>
				
				<h3>참고사항</h3>
				<span>- 업데이트된 기능은 서비스 등록/편집 메뉴에서 확인하실 수 있습니다.</span><br>
				<span>- 전자책을 신규 등록하시거나 기존 서비스를 편집하실 경우 해당 항목을 모두 수정해 주셔야 합니다.</span><br><br>
			
				<span>앞으로도 더욱 편리하고 유용한 서비스를 제공해 드리기 위해 노력하겠습니다.</span><br>
				<span>해당 기능과 관련한 문의사항은 <b>양파마켓 고객센터</b>로 접수해 주세요.</span><br><br>
				<span>감사합니다.</span><br>
			</div>
		</div>
		
		<div id="inner-box">
			<div id="comment_box" >
				<div id="comment-btn">
					<span>다른 질문이 있으신가요?</span><br>
					<a href="/board_qna/register"><button type="button" class="background-purple submit-button">문의하기</button></a>
				</div>
			</div>
		</div>
		
		<div id="inner-box">
		<hr>
		</div>
		
		<div id="inner-box">
		  <div class="button-container">
		    <a href="/board_notice/modify"><button class="background-gray submit-button">수정</button></a>
		    <a href="#"><button class="background-gray cancel-button submit-button">삭제</button></a>
		  </div>
		</div>
		
	</div>


	<jsp:include page="../layout/footer.jsp"></jsp:include>	
</body>
</html>