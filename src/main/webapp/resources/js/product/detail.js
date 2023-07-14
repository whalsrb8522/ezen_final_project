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


// product-status 변경하기
// function updateStatus(status) {
//     let xhr = new XMLHttpRequest();
//     xhr.open("POST", "/product/detail/updateStatus", true);
//     xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//     xhr.onreadystatechange = function () {
//         if (xhr.readyState === 4 && xhr.status === 200) {
//             console.log(xhr.responseText);
//         }
//     };
//     xhr.send("productStatus=" + status);
// }


// async function updateStatus(status) {
//     if (status != null) {
//         try {
//             const url = "/product/detail";
//             const config = {
//                 method: 'post',
//                 headers: {
//                     'Content-Type': 'application/x-www-form-urlencoded'
//                 },
//                 body: 'status=${p_status}'

//                 // 여기 부분에서 value(숫자)만 /product/status으로 넘어가게
//             };
//             const resp = await fetch(url, config);  // 여기까지만 수행해도 될거같음
//             // 만약에 DB에 적용이 잘 되었는지도 확인하여면 result까지 받아오기
//             const result = await resp.text();
//             console.log(result);
//             return result;
//         } catch (error) {
//             console.log(error);
//         }
//     }
// }

// document.querySelector('.product-status').addEventListener('change', () => {
//     const status = document.querySelector('.product-status').value;
//     console.log(status);
//     updateStatus(status);
// });


async function updateStatus() {
    try {
        const selectElement = document.querySelector('select[name="p_status"]');
        const status = selectElement.value;
        console.log(status);

        const url = "/product/detail";
        const config = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `status=${status}`
        };

        const response = await fetch(url, config);
        const result = await response.text();

        console.log(result);
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.querySelector('select[name="p_status"]').addEventListener('change', updateStatus);


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




