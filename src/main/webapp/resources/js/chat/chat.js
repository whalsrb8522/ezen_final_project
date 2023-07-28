// 웹소켓 연결
var sockJs = new SockJS("/echo");
var stomp = Stomp.over(sockJs);

var chatRoomNumber;      // 채팅방 번호
var sessionMemberNumber = sessionMemberNumber;  // 로그인한 회원 번호

var chatDisplayNone = document.getElementById('chatDisplayNone');
var roomTopBoxNick = document.querySelector('.roomTopBox-nick');  // 닉네임 표시
var roomMidBoxEx = document.querySelector('.roomMidBoxEx');       // 상품 정보 표시
var roomMidBox = document.getElementById('roomMidBox');           // 채팅 내용 표시

// STOMP 연결
stomp.connect({}, () => {
    // 메시지 수신했을 경우 채팅방 갱신
    stomp.subscribe('/sub/chat/main/*', (chat) => {
        printChatList();
    });
});

// 채팅방 열기
async function getChat(cr_number) {
    chatDisplayNone.classList.add('dp_none');

    this.chatRoomNumber = cr_number;

    printChatList();
    printChatRoom();

    stomp.subscribe("/sub/chat/main/" + chatRoomNumber, (chat) => {
        receiveMessage(chat);
        printChatRoom();
    });
}

// 채팅방 닫기
document.getElementById('backBtn').addEventListener('click', () => {
    roomMidBox.innerHTML = '';
    chatDisplayNone.classList.remove('dp_none');
});

// 메시지 발신 함수
function sendMessage() {
    let chatInput = document.getElementById('chatInput');

    if (chatInput.value != undefined && chatInput.value != '') {
        stomp.send('/pub/chat/message', {}, JSON.stringify({
            cr_number: chatRoomNumber,
            cm_content: chatInput.value,
            cm_sender: sessionMemberNumber,
            cm_send_date: new Date(),
            cm_type: 't'
        }));
    } else {
        alert('내용을 입력해주세요!');
    }

    chatInput.value = '';
};

// 메시지 수신 함수
function receiveMessage(chat) {
    let message = JSON.parse(chat.body);
 
    console.log(message);

    // printChatList();
    printMessage(chat, sessionMemberNumber);
}

// 채팅목록 출력
async function printChatList() {
    const chatListContainer = document.querySelector('.chatListContainer');

    try {
        const resp = await fetch('/chat/list');
        const result = await resp.json();

        chatListContainer.innerHTML = '';

        for (const cdto of result) {
            // console.log(">>> cdto.lastMessage : " + cdto.lastMessage);
            console.log(">>> cdto.notReadCount : " + cdto.notReadCount);

            let div = `
                <div class="chatList" onclick="getChat(${cdto.crvo.cr_number}, ${sessionMemberNumber})">
                    ${cdto.notReadCount > 0 ? `<div class="chatListCount">${cdto.notReadCount}</div>` : ``}
                    <div class="chatListImg">
                        <img alt="프로필" src="">
                    </div>
                    <div class="chatListText">
                        <div class="chatListTextUp">
                            ${cdto.senderMvo.m_number == sessionMemberNumber ? cdto.receiverMvo.m_nick_name : cdto.senderMvo.m_nick_name}
                        </div>
                        <div class="chatListTextDown">
                            ${cdto.lastMessage == null ? "대화 내용이 없습니다." : cdto.lastMessage}
                        </div>
                    </div>
                </div>
            `;

            chatListContainer.innerHTML += div;
        }
    } catch (error) {
        console.error(error);
    }
}

// 채팅방 내용 출력
async function printChatRoom() {
    try {
        const resp = await fetch('/chat/view/' + chatRoomNumber);
        const cmdto = await resp.json();

        let mvo = cmdto.mvo;
        let pdto = cmdto.pdto;
        let listCmvo = cmdto.listCmvo;

        roomTopBoxNick.innerHTML = mvo.m_nick_name;

        let div = `
            <img alt = "" src = "/resources/fileUpload/${pdto.piList[0].pi_dir}/${pdto.piList[0].pi_uuid}_th_${pdto.piList[0].pi_name}" class="item-image" >
            <div class="item-info">
                <span class="trade-status">거래중</span>
                <span class="price">${pdto.pvo.p_price}원</span>
            </div >
            <span class="trade-title">${pdto.pvo.p_name}</span>`;

        roomMidBoxEx.innerHTML = div;

        roomMidBox.innerHTML = '';

        for (let cmvo of listCmvo) {
            printMessage(cmvo, sessionMemberNumber);
        }
    } catch (error) {
        console.error(error);
    }
}

// 메시지 내용 출력 함수
function printMessage(cmvo, sessionMemberNumber) {
    let roomMidBox = document.getElementById('roomMidBox');
    let div = document.createElement('div');

    if (cmvo.cm_sender == sessionMemberNumber) {
        div.classList.add('sendMessage');
    } else {
        div.classList.add('receiveMessage');
    }

    let date = new Date(cmvo.cm_send_date);
    let hours = ('0' + date.getHours()).slice(-2);
    let minutes = ('0' + date.getMinutes()).slice(-2);

    // console.log(">>> 168 > cmvo.cm_type : " + cmvo.cm_type);    

    if(cmvo.cm_type == 't') {
        div.innerHTML += `
            <div class="chatMessage">
                ${cmvo.cm_content}
            </div >
            <div class="chatTime">
                ${hours}:${minutes}
            </div>
        `;
    } else if (cmvo.cm_type == 'i') {
        (async () => {
            try {
                const resp = await fetch("/chat/image/" + cmvo.cm_number);
                const cmivo = await resp.json();
                
                div.innerHTML += `
                    <div class="chatMessage">
                        <div class="chatImage">
                            <img alt="" src="/resources/fileUpload/chat/${cmivo.cmi_dir}/${cmivo.cmi_uuid}_th_${cmivo.cmi_name}" onload="javascript: roomMidBox.scrollTop = roomMidBox.scrollHeight;">
                        </div>
                    </div >
                    <div class="chatTime">
                        ${hours}:${minutes}
                    </div>
                `;
            } catch (error) {
                console.error(error);
            }
        })();
    }

    roomMidBox.appendChild(div);
    roomMidBox.scrollTop = roomMidBox.scrollHeight;
}

window.onload = () => {
    if (selectRoomNumber != null && selectRoomNumber != '') {
        getChat(selectRoomNumber);
    }
}


// --------------------------------------

// 모달 생성 및 닫기
const modal = document.querySelector('.modal');
const closeModal = document.querySelector('.close-modal');

// 옵션
const options = document.querySelectorAll('.option');

// 파일 업로드 (열기만)
function showFileUploadWindow() {
    const fileInput = document.createElement('input');
    fileInput.type = 'file';
    fileInput.accept = 'image/*';
    fileInput.click();

    fileInput.addEventListener('change', async function (event) {
        const selectedFile = event.target.files[0];

        const formData = new FormData();
        formData.append('file', selectedFile);

        if (selectedFile.type.startsWith("image/")) {
            console.log(">>> chatRoomNumber : " + chatRoomNumber);
            
            stomp.send('/pub/chat/message', {}, JSON.stringify({
                cr_number: chatRoomNumber,
                cm_content: '사진',
                cm_sender: sessionMemberNumber,
                cm_send_date: new Date(),
                cm_type: 'i'
            }));

            const resp = await fetch("/chat/upload", {
                method: 'POST',
                body: formData
            });
        } else {
            alert("이미지 파일만 선택 가능합니다.");
        }
    });
}

// 지도
function showMap() {
}

// 달력
function showRemittanceWindow() {
}

// 이미지 확대
function showImage() {

}

// 모달 여는 버튼 설정
const openModalBtn = document.getElementById('modalBtn');
openModalBtn.addEventListener('click', function () {
    modal.style.display = 'block';
});

// 모달 닫는 버튼 설정
closeModal.addEventListener('click', function () {
    modal.style.display = 'none';
});

window.addEventListener('click', function (event) {
    if (event.target === modal) {
        modal.style.display = 'block';
    }
});

options.forEach(option => {
    const action = option.getAttribute('data-action');
    if (action) {
        option.addEventListener('click', function () {
            eval(action);
            modal.style.display = 'none';
        });
    }
});
