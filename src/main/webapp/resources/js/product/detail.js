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


// 이미지 슬라이더
let sliderImg = document.querySelector('.slider_img');
let sliderInner = document.querySelector('.slider_inner');
let detail_img = document.querySelectorAll('.detail-img');
let slider_dot = document.querySelector('.slider-dot');

let currentIndex = 0;
let sliderCount = detail_img.length;
let sliderWidth;  // 이미지 가로 값

let dotIndex = "";
function init() {
    for (let index = 0; index < sliderCount; index++) {
        dotIndex += `<a class="dot">이미지${index + 1}</a>`;
    }
    slider_dot.innerHTML = dotIndex;
    // 첫 번째 dot 버튼 활성화
    slider_dot.firstElementChild.classList.add('active');

    sliderWidth = sliderImg.offsetWidth;
    sliderInner.style.width = (sliderWidth * sliderCount) + "px"; // 이미지 총 길이 넣기
}
init();

// 이미지 이동
function gotoSlider(num) {
    sliderInner.style.transition = "all 400ms";
    sliderInner.style.transform = "translateX(" + -sliderWidth * num + "px)";
    currentIndex = num;

    // 두 번째 이미지, 두 번째 닷 추가
    // 닷 클래스 모두 삭제
    // 해당 이미지 닷 클래스 추가
    const sliderDotAs = slider_dot.querySelectorAll('a');
    sliderDotAs.forEach((a) => a.classList.remove('active'));
    sliderDotAs[num].classList.add('active');
}

// 닷 버튼 클릭했을 때
document.querySelectorAll(".slider-dot .dot").forEach((dot, index) => {
    dot.addEventListener("click", () => {
        gotoSlider(index);
    });
})


// product-status 변경하기
async function changeStatus(target) {
    var p_status = target.value;
    try {
        const url = '/product/detail';
        const config = {
            method: 'post',
            headers: {
                'content-type': 'application/json;'
            },
            body: JSON.stringify({
                p_number: p_number,
                p_status: p_status
            })
        }
        const response = await fetch(url, config);
    } catch (error) {
        console.error(error);
    }
}

// register에서 등록한 주소 불러와서 지도 생성
let mapContainer = document.getElementById('detail-map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

// 지도를 생성합니다    
let map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
let geocoder = new kakao.maps.services.Geocoder();

// 주소를 담아옵니다
let getLoca = document.getElementById('getLoca').value;

// 주소로 좌표를 검색합니다
geocoder.addressSearch(getLoca, function (result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

        let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        let marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        // var infowindow = new kakao.maps.InfoWindow({
        //     content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        // });
        // infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    }
});

// 이미지 슬라이더
let sliderImg = document.querySelector('.slider_img');
let sliderInner = document.querySelector('.slider_inner');
let detail_img = document.querySelectorAll('.detail-img');
let slider_dot = document.querySelector('.slider-dot');

let currentIndex = 0;
let sliderCount = detail_img.clientHeight;
let sliderWidth = sliderImg.offsetWidth;

sliderInner.style.width = (sliderWidth * sliderCount) + "px";

let dotIndex = "";
function init() {
    sliderCount.forEach((el, index) => dotIndex += `<a href="#" class="dot">이미지${index + 1}</a>`);
    slider_dot.innerHTML = dotIndex;

    slider_dot.firstElementChild.classList.add('active');
}
init();

function gotoSlider(num) {
    sliderInner.style.transition = "all 400ms";
    sliderInner.style.transform = "translateX(" + -sliderWidth * num + "px)";
    currentIndex = num;
}

const sliderDotAs = slider_dot.querySelectorAll('a');
sliderDotAs.forEach((a) => a.classList.remove('active'));
sliderDotAs[num].classList.add('active');

document.querySelectorAll(".slider_dot").forEach((dot, index) => {
    dot.addEventListener("click", () => {
        gotoSlider(index);
    });
})

// 채팅방 개설 관련 (작성자: 조민규)
async function createChatRoom(p_number) {
    console.log(">>> createChatRoom()");
    
    try {
        const url = '/chat/register';
        const config = {
            method: 'post',
            headers: {
                'content-type': 'application/json;'
            },
            body: JSON.stringify({
                p_number: p_number,
                sessionMemberNumber: sessionMemberNumber
            })
        }
        const response = await fetch(url, config);
    } catch (error) {
        console.error(error);
    }
}

function goToChatRoom(p_number) {
    console.log(">>> goToChatRoom()");
    console.log(">>> goToChatRoom() > chatListContainer.innerHTML = " + document.getElementsByClassName('chatListContainer').innerHTML);
}