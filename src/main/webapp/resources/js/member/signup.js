// 약관 전체 선택
function selectAll(selectAll)  {
    const checkboxes = document.getElementsByName('terms');

    checkboxes.forEach((checkbox) => {
       checkbox.checked = selectAll.checked;
    })
}


// 카카오 지도 API
// var container = document.getElementById('kakaoMap'); //지도를 담을 영역의 DOM 레퍼런스
// var options = { //지도를 생성할 때 필요한 기본 옵션
// 	center: new kakao.maps.LatLng(37.45034013579847 , 126.70286743807637), //지도의 중심좌표.
// 	level: 3 //지도의 레벨(확대, 축소 정도)
// };

// var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

// 주소 선택
var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.45034013579847 , 126.70286743807637), // 지도의 중심좌표
            draggable: false,
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.45034013579847 , 126.70286743807637),
        map: map
    });


    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                const incheon = {};

                var addr = data.address; // 최종 주소 변수
                
                var si = addr.split(" ")[0];
                var gungu = addr.split(" ")[1];

                console.log("si : " + si);
                console.log("gungu : " + gungu);
                
                if(addr.substring(0, addr.indexOf(" ")) != "인천") {
                    alert("인천 외 지역 미지원");
                    document.getElementById("mapAddress").value = "";
                    mapContainer.style.display = "none";
                } else {
                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("mapAddress").value = addr;
                    // 주소로 상세 정보를 검색
                    geocoder.addressSearch(data.address, function(results, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {

                            var result = results[0]; //첫번째 결과의 값을 활용

                            // 해당 주소에 대한 좌표를 받아서
                            var coords = new daum.maps.LatLng(result.y, result.x);
                            // 지도를 보여준다.
                            mapContainer.style.display = "block";
                            map.relayout();
                            // 지도 중심을 변경한다.
                            map.setCenter(coords);
                            // 마커를 결과값으로 받은 위치로 옮긴다.
                            marker.setPosition(coords)
                        }
                    });
                }
            }
        }).open();
    }