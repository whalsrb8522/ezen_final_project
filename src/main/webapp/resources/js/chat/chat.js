// 실시간 채팅 전달 기능
var webSocket = {
    url: null,
    socket: null,

    init: function(url) {
        this.url = url;
        this.initSocket();
    },

    sendChat: function() {
        this.sendMessage(bang_id, 'CMD_MSG_SEND', document.getElementById('chatInput').value);
        document.getElementById('chatInput').value = '';
    },

    sendEnter: function() {
        this.sendMessage(bang_id, 'CMD_ENTER', document.getElementById('chatInput').value);
        document.getElementById('chatInput').value = '';
    },

    receiveMessage: function(msgData) {
        console.log(">>> receiveMessage : " + msgData);

        if (msgData.cmd == 'CMD_MSG_SEND') {
            // var divChatData = document.getElementById('divChatData');
            var div = document.createElement('div');
            div.textContent = msgData.msg;
            // divChatData.appendChild(div);

            const roomMidBox = document.getElementById('roomMidBox');
            roomMidBox.append(div)

        } else if (msgData.cmd == 'CMD_ENTER' || msgData.cmd == 'CMD_EXIT') {
            var divChatData = document.getElementById('divChatData');
            var div = document.createElement('div');
            div.textContent = msgData.msg;
            divChatData.appendChild(div);
        }
    },

    closeMessage: function(str) {
        // var divChatData = document.getElementById('divChatData');
        // var div = document.createElement('div');
        // div.textContent = '연결 끊김: ' + str;
        // divChatData.appendChild(div);
    },

    disconnect: function() {
        this.socket.close();
    },

    initSocket: function() {
        this.socket = new SockJS(this.url);

        var self = this;
        this.socket.onopen = function(evt) {
            self.sendEnter();
        };

        this.socket.onmessage = function(evt) {
            console.log("메시지 받음")
            self.receiveMessage(JSON.parse(evt.data));
        };

        this.socket.onclose = function(evt) {
            self.closeMessage(evt.data);
        };
    },

    sendMessage: function(bang_id, cmd, msg) {
        var msgData = {
            bang_id: bang_id,
            cmd: cmd,
            msg: msg
        };
        console.log(msgData);
        var jsonData = JSON.stringify(msgData);
        this.socket.send(jsonData);
    }
};

// 채팅방 출력 관련
async function getChat(cr_number, m_number) {
    console.log(">>> cr_number : " + cr_number);
    console.log(">>> m_number : " + m_number);

    const chatDisplyNone = document.getElementById('chatDisplyNone');
    const roomMidBox = document.getElementById('roomMidBox');
    
    roomMidBox.innerHTML = '';
    chatDisplyNone.classList.add('dp_none');

    try {
        const resp = await fetch('/chat/view/' + cr_number);
        const result = await resp.json();

        console.log(result);
        
        for(let cmvo of result) {
            console.log(">>> cm_sender :" + cmvo.cm_sender);
            console.log(">>> m_number : " + m_number);

            // if(cmvo.cm_sender == m_number) {
            //     div.classList.add('sendMessage');
            // } else {
            //     div.classList.add('receiveMessage');
            // }

            // div.innerHTML += `
            //     <div class="chatMessage"> ` + 
            //         cmvo.cm_content + `
            //     </div>
            //     <div class="chatTime">
            //         00:00
            //     </div>
            // `
            // roomMidBox.appendChild(div);

            printMessage(cmvo.cm_sender, m_number, cmvo.cm_content);
        }

        bang_id = cr_number;
        webSocket.init("/echo");
    } catch (error) {
        console.log(error);
    }

}

// 채팅방 닫기
document.getElementById('backBtn').addEventListener('click', () => {
    const chatDisplyNone = document.getElementById('chatDisplyNone');
    chatDisplyNone.classList.remove('dp_none');
});

function printMessage(serder, loginUser, content) {
    let roomMidBox = document.getElementById('roomMidBox');
    let div = document.createElement('div');

    if(serder == loginUser) {
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