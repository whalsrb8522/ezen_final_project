// // 실시간 채팅 전달 기능
// var webSocket = {
//     url: null,
//     bang_id: null,
//     socket: null,

//     init: function(url, bang_id) {
//         this.url = url;
//         this.bang_id = bang_id;
//         this.initSocket();
//     },

//     sendChat: function() {
//         console.log(">>> chatInput : " + document.getElementById('chatInput').value);

//         this.sendMessage(this.bang_id, 'CMD_MSG_SEND', document.getElementById('chatInput').value);
//         document.getElementById('chatInput').value = '';
//     },

//     sendEnter: function() {
//         // this.sendMessage(this.bang_id, 'CMD_ENTER', document.getElementById('chatInput').value);
//         // document.getElementById('chatInput').value = '';

//         console.log("세션 열림");
//     },

//     receiveMessage: function(msgData) {
//         if (msgData.cmd == 'CMD_MSG_SEND') {
//             // var divChatData = document.getElementById('divChatData');
//             var div = document.createElement('div');
//             div.textContent = msgData.msg;
//             // divChatData.appendChild(div);

//             const roomMidBox = document.getElementById('roomMidBox');
//             roomMidBox.append(div)
//         } else if (msgData.cmd == 'CMD_ENTER' || msgData.cmd == 'CMD_EXIT') {
//             var divChatData = document.getElementById('divChatData');
//             var div = document.createElement('div');
//             div.textContent = msgData.msg;
//             divChatData.appendChild(div);
//         }
//     },

//     closeMessage: function(str) {
//         // var divChatData = document.getElementById('divChatData');
//         // var div = document.createElement('div');
//         // div.textContent = '연결 끊김: ' + str;
//         // divChatData.appendChild(div);

//         console.log("세션 닫힘");
//     },

//     disconnect: function() {
//         this.socket.close();
//     },

//     initSocket: function() {
//         this.socket = new SockJS(this.url);

//         this.socket.onopen = function(evt) {
//             webSocket.sendEnter();
//         };

//         this.socket.onmessage = function(evt) {
//             webSocket.receiveMessage(JSON.parse(evt.data));
//         };

//         this.socket.onclose = function(evt) {
//             webSocket.closeMessage(JSON.parse(evt.data));
//         }
//     },

//     sendMessage: function(bang_id, cmd, msg) {
//         var msgData = {
//             bang_id: bang_id,
//             cmd: cmd,
//             msg: msg
//         };
//         var jsonData = JSON.stringify(msgData);
//         this.socket.send(jsonData);
//     }
// };

var chatRoomNumber = null;
var sessionMemberNumber = sessionMemberNumber;

console.log(">>> sessionMemberNumber : " + sessionMemberNumber);

// 채팅방 목록 불러오기
async function getChat(cr_number, ses_m_number) {
    const chatDisplyNone = document.getElementById('chatDisplyNone');
    const roomMidBox = document.getElementById('roomMidBox');
    
    roomMidBox.innerHTML = '';
    chatDisplyNone.classList.add('dp_none');

    chatRoomNumber = cr_number;
    console.log(">>> getCat() > chatRommNumber = " + chatRoomNumber);

    try {
        const resp = await fetch('/chat/view/' + cr_number);
        const result = await resp.json();
        
        for(let cmvo of result) {
            printMessage(cmvo.cm_sender, ses_m_number, cmvo.cm_content);
        }
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

    if(sender == loginUser) {
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

// 웹소켓 연결
var sockJs = new SockJS("/echo");
var stomp = Stomp.over(sockJs);

stomp.connect({}, () => {
    stomp.subscribe("/sub/chat/room/" + chatRoomNumber, function (chat) {
        var content = JSON.parse(chat.body);

        var message = content.message;
        var writer = content.writer;
        
        printMessage(1, 1, message)
    });
});

function sendMessage() {
    var chatInput = document.getElementById('chatInput');

    console.log(">>> chatInput : " + chatInput.value);

    stomp.send('/pub/chat/message', {}, JSON.stringify({cr_number: chatRoomNumber, message: chatInput.value, writer: 1}));

    chatInput.value = '';
};
