<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양파마켓 | 목록</title>
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/product/list.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<!-- 전체 감싸는 div -->
	<div id="list-wrapper">
		<div id="cate-wrap">
			<span><b>카테고리</b></span><br>
		</div>
		<div class="border-gray category">전자기기</div>
		<div class="border-gray category">아웃도어, 스포츠</div>
		<div class="border-gray category">자동차용품, 공구</div>
		<div class="border-gray category">가구, 조명</div> <br>
		<div class="border-gray category">유아, 완구</div>
		<div class="border-gray category">생활, 주방, 건강</div>
		<div class="border-gray category">패션, 잡화</div>
		<div class="border-gray category">사무, 취미</div>
		<br>

		<!-- c:if 감싸기 -->
		<div id="result-wrap">
			<span><span style="color: #C97FE8"><b>수정</b></span>의 검색결과 <span style="color: gray">수정몇 개</span></span>
		</div><br>
		<!-- 상품 리스트 -->
		<!-- forEach 돌리기 -->
		<div>
		
		
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/reservation.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/completed.png" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			<div class="product-wrapper">
				<div class="product-photo">
					<img alt="없음" src="/resources/image/44.jpg" class="product-photo">
					<!-- 구매가능, 예약중, 거래완료 -->
					<div class="product-status">
						<img alt="" src="/resources/image/purchase.png">
					</div>
				</div>
				<div class="product-title">짱구놈 팔아요하나둘셋야빰빰빰빰빰빠빰빠마ㅃㅁ빰빰빰!</div>
				<div class="product-price"><b>2,000 <span style="font-size:12px">원</span></b></div>
				<hr>
				<div class="product-location">
					<span class="material-symbols-outlined">location_on</span>
					인천광역시 계양구
				</div>
			</div>
			
			
			
		</div> <br>
		
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
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>