// 웹소켓 연결
var sockJs = new SockJS("/echo");
var stomp = Stomp.over(sockJs);

var cr_number;      // 채팅방 번호
var sessionMemberNumber = sessionMemberNumber;  // 로그인한 회원 번호

var chatDisplayNone = document.getElementById('chatDisplayNone');
var roomTopBoxNick = document.querySelector('.roomTopBox-nick');  // 닉네임 표시
var roomMidBoxEx = document.querySelector('.roomMidBoxEx');       // 상품 정보 표시
var roomMidBox = document.getElementById('roomMidBox');           // 채팅 내용 표시


// STOMP 연결
stomp.connect({}, () => {
    // STOMP 연결 끊겼을 경우
    stomp.ws.onclose = function (event) {
        stomp.send('/pub/chat/disconnet', {}, JSON.stringify({ cr_number: this.cr_number, cm_sender: this.sessionMemberNumber }));
    };

    // 메시지 수신했을 경우 채팅방 갱신
    stomp.subscribe("/sub/chat/main/*", (chat) => {
        printChatList();
    });
});

// 채팅방 열기
async function getChat(cr_number) {
    chatDisplayNone.classList.add('dp_none');

    this.cr_number = cr_number;

    printChatRoom(this.cr_number);
    printChatList();

    stomp.subscribe("/sub/chat/main/" + cr_number, (chat) => {
        console.log(">>> mainChat : " + chat);
        receiveMessage(chat);
        roomMidBox.scrollTop = roomMidBox.scrollHeight;
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

    if (chatInput.value != undefined || chatInput.value == '') {
        stomp.send('/pub/chat/message', {}, JSON.stringify({ cr_number: this.cr_number, cm_content: chatInput.value, cm_sender: this.sessionMemberNumber }));
    }

    chatInput.value = '';
};

// 메시지 수신 함수
function receiveMessage(chat) {
    console.log(">>> receiveMessage() > chat : " + chat);

    let content = JSON.parse(chat.body);
    let cm_content = content.cm_content;
    let cm_sender = content.cm_sender;

    printMessage(cm_sender, sessionMemberNumber, cm_content);
    printChatList();
}

// 채팅목록 출력
async function printChatList() {
    const chatListContainer = document.querySelector('.chatListContainer');
    console.log(chatListContainer);

    try {
        const resp = await fetch('/chat/list');
        const result = await resp.json();

        chatListContainer.innerHTML = '';

        for (const cdto of result) {
            let div = `
                <div class="chatList" onclick="getChat(${cdto.crvo.cr_number}, ${sessionMemberNumber})">
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
async function printChatRoom(cr_number) {
    try {
        const resp = await fetch('/chat/view/' + this.cr_number);
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
            printMessage(cmvo.cm_sender, sessionMemberNumber, cmvo.cm_content);
            roomMidBox.scrollTop = roomMidBox.scrollHeight;
        }
    } catch (error) {
        console.error(error);
    }
}

// 메시지 내용 출력 함수
function printMessage(sender, loginUser, content) {
    let roomMidBox = document.getElementById('roomMidBox');
    let div = document.createElement('div');

    if (sender == loginUser) {
        div.classList.add('sendMessage');
    } else {
        div.classList.add('receiveMessage');
    }

    div.innerHTML += `
        <div class="chatMessage">
            ${content}
        </div >
        <div class="chatTime">
            00:00
        </div>
    `;

    roomMidBox.appendChild(div);
}

window.onload = () => {
    if (selectRoomNumber != null && selectRoomNumber != '') {
        getChat(selectRoomNumber);
    }
}
