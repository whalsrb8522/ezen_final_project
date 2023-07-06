
// 이메일 - 아이디 , @ , 도메인 주소 합치기

window.onload = function () {
    document.getElementById("innerContainer").onsubmit = function () {
        var user_email = document.getElementById("user_email").value;
        var email_address = document.getElementById("email_address").value;

        if(user_email && email_address && email_address !== "선택해주세요") {
            document.getElementById("m_mail").value = user_email + "@" + email_address;
            return true; 
        }
        else {
            
            alert('올바른 이메일 주소를 입력해주세요');
            return false; 
        }
    }
}

// ----------------------------------------------------------

// 자기소개 필수 입력 조항 삽입

document.getElementById('innerContainer').addEventListener('submit', function(e) {
    var introductField = document.getElementById('m_introduct');
    
    if(introductField.value === '') {
        alert('자기소개를 입력해주세요.');
        e.preventDefault();
    }
});


// --------------------------------------------------------

// 프로필 사진 파일 업로드 

document.getElementById('imageChoose').addEventListener('change', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    
    reader.onloadend = function() {
        // 이미지 선택
        document.getElementById('imagePrint').src = reader.result;
        
        // TODO: Upload the file to the server.
    }
    
    reader.readAsDataURL(file);
});

// -------------------------------------------------------

// 비밀번호 조건 (영문, 숫자 8글자 이상)

document.getElementById('innerContainer').addEventListener('submit', function(e) {
    var passwordField = document.getElementById('m_pw');
    
    var password = passwordField.value;
    
    var passwordReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    
    if (!passwordReg.test(password)) {
        alert('비밀번호는 영문, 숫자를 포함한 8자 이상이어야 합니다.');
        e.preventDefault();
    }
});

// -------------------------------------------------------

// 비밀번호 일치 확인

var passwordField = document.getElementsByName('m_pw')[0];
var passwordCheckField = document.getElementsByName('m_pw_check')[0];

passwordCheckField.addEventListener('blur', function() {
    if(passwordField.value !== passwordCheckField.value) {
        alert('비밀번호가 일치하지 않습니다.');
    }
});


// ----------------------------------------------------

// 이메일 유효성 검사 

document.getElementById('emailBtn').addEventListener('click', function(e) {
    var emailField = document.getElementById('user_email');
    
    if (!emailField.checkValidity()) {
        alert('올바른 이메일 주소를 입력해주세요.');
        e.preventDefault();
    }
});







// -----------------------------------------------------------

// 약관 전체 선택
function selectAll(selectAll)  {
    const checkboxes = document.getElementsByName('terms');

    checkboxes.forEach((checkbox) => {
       checkbox.checked = selectAll.checked;
    })
}
// ------------------------------------------------------------

// 주소 선택
var mapContainer = document.getElementById('kakaoMap'); // 지도를 표시할 div
    
mapOption = {
    center: new daum.maps.LatLng(37.45034013579847 , 126.70286743807637), // 지도의 중심좌표
    draggable: false,
    level: 3 // 지도의 확대 레벨
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
                // 'm_address'에 주소 설정
            	document.getElementById("m_address").value = addr;
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
// --------------------------------------------------------------------------------

// 회원탈퇴 체크
function removeMember() {
    var confirmcheck = confirm("정말로 탈퇴하시겠습니까?");

    if(confirmcheck) {
        alert("탈퇴되었습니다.");
    } else {
        alert("취소되었습니다.");
    }
}