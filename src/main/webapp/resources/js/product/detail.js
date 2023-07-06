// 카테고리 나타내기
let detailCate = document.getElementById('detail-cate-wrap');
let detailscroll = document.querySelector('.detail-cate-scroll');

detailCate.addEventListener('mouseover', () => {
    detailscroll.classList.replace("detail-cate-scroll", "detail-cate-scroll-over");
})
detailCate.addEventListener('mouseout', () => {
    detailscroll.classList.replace("detail-cate-scroll-over", "detail-cate-scroll");
    // detailscroll.classList.remove("detail-cate-scroll-over");
    // detailscroll.classList.add("detail-cate-scroll");
})



// 이미지 지도에서 마커가 표시될 위치입니다 
let markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
let marker = {
    position: markerPosition
};

let staticMapContainer = document.getElementById('detail-map'), // 이미지 지도를 표시할 div  
    staticMapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
        level: 2, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
    };

// 이미지 지도를 생성합니다
let staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);