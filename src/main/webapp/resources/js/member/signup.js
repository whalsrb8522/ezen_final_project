
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
            
            alert('올바른 이메일 주소를 입력해주세용');
            return false; 
        }
    }
}


// 닉네임 중복 확인

function checkNickname() {
    var nick = $('#nick').val();

    if(nick.length < 2 || nick.length > 15){
        $(".successNameChk").text('닉네임은 2 ~ 15 글자여야 합니다.');
        $(".successNameChk").css("color", "red");
        $("#nickValid").val("false");

        return;
    }
    console.log("nick: " + nick);  // nick 값 로그 출력

    $.ajax({
        url: '/member/nicknameCheck',  
        type: 'POST',  
        data: {m_nick_name: nick},  
        success: function(data) {
            console.log("Server response: ", data);
            var xmlString = new XMLSerializer().serializeToString(data);
            console.log("XML string: ", xmlString);

            // XML 응답 파싱
            var parser = new DOMParser();
            var xmlDoc = parser.parseFromString(xmlString, "text/xml");

            // 'Integer' 태그의 값 얻기
            var intValue = parseInt(xmlDoc.getElementsByTagName("Integer")[0].childNodes[0].nodeValue);
            
            if (intValue == 0) {
                $(".successNameChk").text("사용가능한 닉네임입니다.");
				$(".successNameChk").css("color", "green");
                $("#nickValid1").val("true");
			
            } else {
                $(".successNameChk").text("사용중인 닉네임입니다");
				$(".successNameChk").css("color", "red");
                $("#nickValid1").val("false");
			
            }
        },
        error: function(err) {
            console.log(err);
            $("#nickValid").val("false");
            $("#nickValid1").val("false");
        }
    });
}



// --------------------------------------------------------

// 프로필 사진 파일 업로드 


const regExp = new RegExp("\.(exe|sh|bat|msi|dll|js)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif|bmp)$");
const maxSize = 1024*1024*20;

function fileSizeValidation(fileName, fileSize){
    if(regExp.test(fileName)){
        return 0;
    }else if(fileSize > maxSize){
        return 0;
    }else if(!regExpImg.test(fileName)){ //이미지 파일이 아니면 첨부 X
        return 0;
    }else {
        return 1;
    }
}

document.addEventListener('DOMContentLoaded', function() {
    var imagePathElement = document.getElementById('imagePath');

    var handleImageChange = function(e){
        document.getElementById('submitBtn').disabled = false;
        const fileObject = e.target.files;

        let isOk = 1;
        let file = fileObject[0];
        let vaildResult = fileSizeValidation(file.name, file.size);
        isOk *= vaildResult;

        if(isOk != 0) { 
            document.getElementById('displayImagePath').value = file.name;
        }

        if(isOk == 0){ 
            document.getElementById('submitBtn').disabled = true;
        }

        if (file && file.type.startsWith("image")) {
            var reader = new FileReader();

            reader.onload = function(e) {
                document.getElementById('imagePreview').src = e.target.result;

                var imageWrapper = document.getElementById('imageWrapper');
                imageWrapper.style.display = 'block';
            }

            reader.readAsDataURL(file);
        }
    }

    imagePathElement.removeEventListener('change', handleImageChange);
    imagePathElement.addEventListener('change', handleImageChange);

    document.getElementById('removeImage').addEventListener('click', function() {
        var previewImage = document.getElementById('imagePreview');
        previewImage.src = '';

        var imagePath = document.getElementById('imagePath');
        imagePath.value = '';

        var displayImagePath = document.getElementById('displayImagePath');
        displayImagePath.value = '';

        var imageWrapper = document.getElementById('imageWrapper');
        imageWrapper.style.display = 'none';
    });
});



// -------------------------------------------------------

// 비밀번호 조건 (영문, 숫자 8글자 이상) - 현재는 특수문자 제외했음

document.addEventListener('DOMContentLoaded', function() {
    var passwordReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
  
    document.getElementById('userpw').addEventListener('blur', function() {
        var password = document.getElementById('userpw').value;
    
        if (!passwordReg.test(password)) {
            document.querySelector('.passwordAlert').innerText = "비밀번호는 영문, 숫자를 모두 포함한 8자 이상이어야 합니다.";
            document.querySelector('.passwordAlert').style.color = "red";
            document.getElementById('userpwValid').value = "false";
        } else {
            document.querySelector('.passwordAlert').innerText = "";
            document.getElementById('userpwValid').value = "true";
        }
    });

    //  비밀번호 일치 확인
  
    document.getElementById('userpwchk').addEventListener('blur', function() {
        var password = document.getElementById('userpw').value;
        var passwordCheck = document.getElementById('userpwchk').value;
    
        if (passwordCheck === password) {
            document.querySelector('.successPwChk').innerText = "비밀번호가 일치합니다.";
            document.querySelector('.successPwChk').style.color = "green";
            document.getElementById('userpwMatch').value = "true";
        } else {
            document.querySelector('.successPwChk').innerText = "비밀번호가 일치하지 않습니다.";
            document.querySelector('.successPwChk').style.color = "red";
            document.getElementById('userpwMatch').value = "false";
        }
    });
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

// -------------------------------------------------------------

// 회원가입 유효성 검사

document.getElementById('innerContainer').addEventListener('submit', function(event) {
    if (!validateForm()) {
        event.preventDefault();  // 유효성 검사에 실패하면 폼 제출 중단
    }
});

function validateForm() {
    var validationErrors = [];

    // 닉네임 길이 조건
    if ($("#nickValid").val() !== "true") {
        validationErrors.push("닉네임 길이를 확인해주세요");
        
    }

    // 닉네임 중복확인
    if ($("#nickValid1").val() !== "true") {
        validationErrors.push("닉네임이 이미 사용중입니다");
        
    }

    // 비밀번호 조건 확인
    if ($("#userpwValid").val() !== "true") {
        validationErrors.push("비밀번호는 영문, 숫자를 모두 포함한 8자 이상이어야 합니다");
        
    }

    // 비밀번호 일치 확인
    if ($("#userpwMatch").val() !== "true") {
        validationErrors.push("비밀번호가 일치하지 않습니다");
        
    }

    // 카카오맵 주소 확인
    if (!document.getElementById("m_address").value) {
        validationErrors.push("주소를 입력해주세요");
        
    }

    // 이용약관 확인
    var terms1 = document.getElementById("terms1").checked;
    var terms2 = document.getElementById("terms2").checked;
    var terms3 = document.getElementById("terms3").checked;

    if (!(terms1 && terms2 && terms3)) {
        validationErrors.push("필수약관을 선택해주세요");
        
    }

    // 보안인증(reCAPTCHA) 통과
    if (grecaptcha.getResponse() === "") {
        validationErrors.push("보안인증을 완료해주세요.");
        console.log("reCAPTCHA 유효성 검사 오류");
    }

    // 검사 후 오류가 있으면(validationErrors 배열 길이가 0보다 큰 경우) 오류 메세지 표시
    if (validationErrors.length > 0) {
        alert(validationErrors.join('\n'));
        // 유효성 검사 오류가 있을 시 양식 제출 중지
        return false;
        console.log("유효성 검사 오류발생");
    }
    return true;
    console.log("유효성 검사 통과");
}
