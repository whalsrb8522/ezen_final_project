// 웹소켓 연결
var sockJs = new SockJS("/echo");
var stomp = Stomp.over(sockJs);
var cr_number;
var sessionMemberNumber = sessionMemberNumber;

console.log(">>> sessionMemberNumber : " + sessionMemberNumber);

// 채팅방 목록 불러오기
async function getChat(cr_number, ses_m_number) {
    const chatDisplyNone = document.getElementById('chatDisplyNone');
    const roomMidBox = document.getElementById('roomMidBox');

    roomMidBox.innerHTML = '';
    chatDisplyNone.classList.add('dp_none');

    this.cr_number = cr_number;
    // console.log(">>> getCat() > chatRommNumber = " + chatRoomNumber);

    try {
        const resp = await fetch('/chat/view/' + this.cr_number);
        const result = await resp.json();

        for (let cmvo of result) {
            printMessage(cmvo.cm_sender, ses_m_number, cmvo.cm_content);
        }

        stomp.subscribe("/sub/chat/main/1", (chat) => {
            console.log(">>> stomp.subscribe");
            receiveMessage(chat);
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

// 메시지 내용 출력
function printMessage(sender, loginUser, content) {
    let roomMidBox = document.getElementById('roomMidBox');
    let div = document.createElement('div');

    // console.log(">>> printMessage() > sender = " + sender);
    // console.log(">>> printMessage() > loginUser = " + loginUser);
    if (sender == loginUser) {
        div.classList.add('sendMessage');
    } else {
        div.classList.add('receiveMessage');
    }

    div.innerHTML += `
        <div class="chatMessage"> ` +
        content + `
        </div>
        <div class="chatTime">
            00:00
        </div>
    `
    roomMidBox.appendChild(div);
}

// 메시지 발신
function sendMessage() {
    var chatInput = document.getElementById('chatInput');
    console.log(">>> chatInput : " + chatInput.value);

    stomp.send('/pub/chat/message', {}, JSON.stringify({ cr_number: this.cr_number, cm_content: chatInput.value, writer: 1 }));

    chatInput.value = '';
};

// 메시지 수신
function receiveMessage(chat) {
    console.log(">>> receiveMessage()");
    console.log(">>> receiveMessage() > chat = " + chat);

    var content = JSON.parse(chat.body);
    var message = content.message;
    var writer = content.writer;

    printMessage(1, 1, message);
}



// STOMP 연결
stomp.connect({}, () => { });