// 기본 비밀번호 확인 (일치하지 않을 시 폼 제출X)

document.getElementById('innerContainer').addEventListener('submit', function(e){
    e.preventDefault();
    
    var oldPassword = document.getElementById('userpw').value;
    console.log("Submitting form with password: " + oldPassword);
    
    

    $.ajax({
    type: "POST",
    url: "/member/checkPassword",
    data: {
        m_pw: oldPassword
    },
    dataType: "json",
    success: function(response){
        console.log("Response received: " + response);
        console.log("Submitted password (unencrypted): " + oldPassword); // 비밀번호 로깅
        if(response === true){
            // 기존 비밀번호가 일치하면 폼 제출
            document.getElementById('innerContainer').submit();
        }else{
            // 기존 비밀번호가 일치하지 않다면 alert
            alert("입력하신 비밀번호가 기존 비밀번호와 일치하지 않습니다.");
        }
    }
});

});








// 닉네임 중복 확인

function checkNickname() {
     var nick = $('#nick').val();
 
     if(nick.length < 2 || nick.length > 15){
         $(".successNameChk").text('닉네임은 2 ~ 15 글자여야 합니다.');
         $(".successNameChk").css("color", "red");
         $("#nickValid").val("false");
 
         return;
     }else {
         $("#nickValid").val("true");
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

// 비밀번호 변경

document.addEventListener('DOMContentLoaded', function() {
     var passwordReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
 
     // 변경 비밀번호 확인
     document.getElementById('changePw').addEventListener('blur', function() {
         var newPassword = document.getElementById('changePw').value;
         
         console.log("New password (unencrypted): " + newPassword); // 비밀번호 로깅
     
         if (!passwordReg.test(newPassword) && newPassword.length > 0) { // newPassword의 길이가 0보다 클 경우에만 코드 실행
             document.querySelector('.newPasswordAlert').innerText = "영문, 숫자를 모두 포함한 8자 이상이어야 합니다.";
             document.querySelector('.newPasswordAlert').style.color = "red";
         } else {
             document.querySelector('.newPasswordAlert').innerText = "";
         }
     });
 
     // 변경 비밀번호와 변경 비밀번호 확인 일치
     document.getElementById('changePwChk').addEventListener('blur', function() {
         var newPassword = document.getElementById('changePw').value;
         var passwordCheck = document.getElementById('changePwChk').value;
     
         if (passwordCheck.length > 0) { // passwordCheck의 길이가 0보다 클 경우에만 코드 실행
             if (passwordCheck === newPassword) {
                 document.querySelector('.successPwChk').innerText = "비밀번호가 일치합니다.";
                 document.querySelector('.successPwChk').style.color = "green";
             } else {
                 document.querySelector('.successPwChk').innerText = "비밀번호가 일치하지 않습니다.";
                 document.querySelector('.successPwChk').style.color = "red";
             }
         }
     });
 });
 


// 기존 데이터들 불러오기(프로필 사진 및 주소)

//프로필 사진 업로드
const regExp = new RegExp("\.(exe|sh|bat|msi|dll|js)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif|bmp)$");
const maxSize = 1024*1024*20;

// 파일 유효성 검사
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
     var imageWrapper = document.getElementById('imageWrapper');
     var previewImage = document.getElementById('imagePreview');
     var mapAddress = document.getElementById('mapAddress').value;

    //기존 이미지가 있으면 display : block / 없으면 (이미지 로딩에 오류가 있으면) none
	var tempImage = new Image();

	tempImage.onload = function() {
	    imageWrapper.style.display = 'block';
	}
	
	tempImage.onerror = function() {
	    imageWrapper.style.display = 'none';
	}
	
	tempImage.src = previewImage.src;

	
    
    // 기존 주소가 있는 경우 주소맵 표시
    if (mapAddress !== "") {
        geocoder.addressSearch(mapAddress, function(results, status) {
            if (status === daum.maps.services.Status.OK) {
                var result = results[0];
                var coords = new daum.maps.LatLng(result.y, result.x);
                mapContainer.style.display = "block";
                map.relayout();
                map.setCenter(coords);
                marker.setPosition(coords)
            }
        });
    }

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

//주소
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


// 기존 약관 불러오기 (추가할 것)


//회원탈퇴

function removeMember() {
    if(confirm("회원 탈퇴를 진행하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/member/remove",
            success: function(response) {
                alert('탈퇴가 정상적으로 완료되었습니다.');
                window.location.href = '/member/signin';  // 로그인 페이지로 이동
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('회원 탈퇴에 실패하였습니다. 다시 시도해주세요.');
                console.log(jqXHR, textStatus, errorThrown);
            }
        });
    }
}







