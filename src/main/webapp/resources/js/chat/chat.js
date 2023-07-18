// 웹소켓 연결
var sockJs = new SockJS("/echo");
var stomp = Stomp.over(sockJs);

var cr_number;
var sessionMemberNumber = sessionMemberNumber;

var roomTopBoxNick = document.querySelector('.roomTopBox-nick');  // 닉네임 표시
var roomMidBoxEx = document.querySelector('.roomMidBoxEx');       // 상품 정보 표시
var roomMidBox = document.getElementById('roomMidBox');           // 채팅 내용 표시

// 메시지 내용 불러오기
async function getChat(cr_number, ses_m_number) {
    const chatDisplyNone = document.getElementById('chatDisplyNone');

    roomMidBox.innerHTML = '';
    chatDisplyNone.classList.add('dp_none');

    this.cr_number = cr_number;

    try {
        const resp = await fetch('/chat/view/' + this.cr_number);
        const result = await resp.json();

        let mvo = result.mvo;
        let pvo = result.pvo;
        let listCmvo = result.listCmvo;

        console.log(">>> pvo.p_name = " + pvo.p_name);

        roomTopBoxNick.innerHTML = mvo.m_nick_name;

        let div = `
            <img alt="" src="" class="item-image">
            <div class="item-info">
                <span class="trade-status">거래중</span>
                <span class="price">${pvo.p_price}원</span>
            </div >
            <span class="trade-title">${pvo.p_name}</span>`;

        roomMidBoxEx.innerHTML = div;

        for (let cmvo of listCmvo) {
            printMessage(cmvo.cm_sender, ses_m_number, cmvo.cm_content);
            roomMidBox.scrollTop = roomMidBox.scrollHeight;
        }

        stomp.subscribe("/sub/chat/main/" + cr_number, (chat) => {
            receiveMessage(chat);
            roomMidBox.scrollTop = roomMidBox.scrollHeight;
        });
    } catch (error) {
        console.log(error);
    }
}

// 채팅방 닫기
document.getElementById('backBtn').addEventListener('click', () => {
    const chatDisplyNone = document.getElementById('chatDisplyNone');
    chatDisplyNone.classList.remove('dp_none');
});

// 메시지 수신 함수
function receiveMessage(chat) {
    console.log(">>> receiveMessage()");
    console.log(">>> receiveMessage() > chat = " + chat);

    let content = JSON.parse(chat.body);
    let cm_content = content.cm_content;
    let cm_sender = content.cm_sender;

    printMessage(cm_sender, sessionMemberNumber, cm_content);
    listChat();
}

async function listChat() {
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
                </div>`;

            console.log(div);
            chatListContainer.innerHTML += div;
        }
    } catch (error) {
        console.log(error);
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
        </div>
        <div class="chatTime">
            00:00
        </div>`

    roomMidBox.appendChild(div);
}

// 메시지 발신 함수
function sendMessage() {
    let chatInput = document.getElementById('chatInput');

    if (chatInput.value != null) {
        stomp.send('/pub/chat/message', {}, JSON.stringify({ cr_number: this.cr_number, cm_content: chatInput.value, cm_sender: this.sessionMemberNumber }));
    }

    chatInput.value = '';
};

// STOMP 연결
stomp.connect({}, () => { });
