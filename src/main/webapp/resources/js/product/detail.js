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


// async function updateStatus() {
//     try {
//         const selectElement = document.querySelector('select[name="p_status"]');
//         const status = selectElement.value;
//         console.log(status);

//         const url = "/product/detail";
//         const config = {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/x-www-form-urlencoded'
//             },
//             body: `status=${status}`
//         };

//         const response = await fetch(url, config);
//         const result = await response.text();

//         console.log(result);
//         return result;
//     } catch (error) {
//         console.log(error);
//     }
// }

// document.querySelector('select[name="p_status"]').addEventListener('change', updateStatus);

// async function updateStatus(value) {
//     console.log(">>> updateStatus() > value = " + value); 
//     try {
//         const url = "/product/detail";
//         const config = {
//             method: 'PUT',
//             headers: {
//                 'content-type': 'application/json; charset=utf-8'
//             },
//             body: value
//         };
//         const response = await fetch(url, config);
//         const result = await response.text();
//         console.log(result);
//         return result;
//     } catch (error) {
//         console.log(error);
//     }
// }

// document.addEventListener('change', (e)=>{
//     if(e.target.classList.contains("product-status")){
//         console.log(e.target);
//         const status = parseInt(e.target.value);
//         console.log(status);

//         let value = status;
//         console.log("value의 값은"+value);
//         // 서버 연결
//         updateStatus(value).then(result=>{})
//     }
// })
// let selectElement = document.querySelector('select[name="p_status"]');
// selectElement.addEventListener('change', async ()=>{
//     try {
//         let status = selectElement.value;
//         const url = "/product/detail";
//         const config = {
//             method: 'PUT',
//             headers: {
//               'Content-Type': 'application/json'
//             },
//             body: JSON.stringify({ p_status: parseInt(status) })
//           };
//         const response = await fetch(url, config);
//         const data = await response.json();
//         console.log(data);
//     } catch (error) {
//         console.log(error);
//     }

// } )


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
geocoder.addressSearch(getLoca, function(result, status) {

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


