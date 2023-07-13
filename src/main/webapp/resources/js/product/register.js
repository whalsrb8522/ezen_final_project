let mapContainer = document.getElementById('regi-map'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

//지도를 미리 생성
let map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
let geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
let marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
});


function search_loca() {
    new daum.Postcode({
        oncomplete: function (data) {
            let addr = data.address; // 최종 주소 변수

            if (addr.substring(0, addr.indexOf(" ")) != "인천") {
                alert("인천 외 지역 미지원");
                document.getElementById("search-address").value = "";
                mapContainer.style.display = "none";
            } else {
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("search-address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function (results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        let result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        let coords = new daum.maps.LatLng(result.y, result.x);
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

// file upload
function setDetailImage(event) {
    for (let image of event.target.files) {
        let reader = new FileReader();

        let li = document.createElement("li");
        let tmp = `<li class="regi-file">
						<img alt="상품이미지" src="" style="width:202px;height:202px;">
						<button type="button" class="file-del"></button>
					</li>`;

        li.innerHTML = tmp;

        reader.onload = function (event) {
            document.querySelector('.file-ul').appendChild(li);
            li.querySelector("img").setAttribute('src', event.target.result);


            document.querySelector('.file-del').addEventListener('click', () => {
                document.querySelector('.file-ul').removeChild(li);
            })
        };
        reader.readAsDataURL(image);
    }
}




// const handler = {
//     init() {
//         const fileInput = document.querySelector('.file-input');
//         const ul = document.querySelector('.file-ul');
//         fileInput.addEventListener('change', () => {
//             const files = Array.from(fileInput.files)
//             files.forEach(file => {
//                 ul.innerHTML += `<li class="regi-file" id="${file.lastModified}">
// 						<img alt="상품이미지" src="" style="width:202px;height:202px;">
// 						<button type="button" class="file-del" data-index="${file.lastModified}"></button>
// 					</li>`;
//             });
//         });
//     },
//     removeFile: () => {
//         document.addEventListener('click', (e) => {
//             if (e.target.className !== 'file-del') return;
//             const removeTargetId = e.target.dataset.index;
//             const removeTarget = document.getElementById(removeTargetId);
//             const files = document.querySelector('.file-input').files;
//             const dataTranster = new DataTransfer();

//             Array.from(files).filter(file => file.lastModified != removeTargetId).forEach(file => {
//                 dataTranster.items.add(file);
//             });

//             document.querySelector('.file-input').files = dataTranster.files;

//             removeTarget.remove();
//         })
//     }
// }

// handler.init();
// handler.removeFile();

// function deleteList(event) {                    // argument 입력(보통 event라고 적음)
//     const li = event.target.parentElement;      // 버튼의 부모요소 접근하고 변수에 넣음
//     li.remove();                                // 삭제
// }

// button.addEventListener("click", deleteList);   // 버튼 클릭 시 삭제되도록 event 삽입


// 카테고리 선택
const cate_btn = document.querySelectorAll('.cate-btn');
const p_category = document.getElementById('p_category');
cate_btn.forEach((item) => {
    item.addEventListener('click', () => {
        cate_btn.forEach((e) => {
            e.classList.remove('cate-btn-click');
        })
        item.classList.add('cate-btn-click');
        p_category.value = item.value;
    })
})

// null값 있을 시에 폼 제출 막음
function validateForm(event) {
    console.log(event);
    event.preventDefault();  // 폼 제출 이벤트 기본 동작 방지

    let nameInput = document.getElementById('nameInput');
    let nameError = document.getElementById('nameError');
    if (nameInput.value.trim() == "") {
        nameError.innerHTML = "제목을 입력하세요.";
        return;
    } else {
        nameError.innerHTML = "";
    }

    // 폼 제출
    document.getElementById('registerForm').submit();
}

// 글자수 체크 & 제한
let counting = document.getElementById('counting');
let nameInput = document.getElementById('nameInput');
let maxLength = 20;
function counter() {
    let tmp = nameInput.value.length;
    tmp += `/20`;
    counting.innerHTML = tmp;

    if (nameInput.value.length > maxLength) {
        nameInput.value = nameInput.value.substr(0, maxLength);
    }
    return nameInput.value;
}