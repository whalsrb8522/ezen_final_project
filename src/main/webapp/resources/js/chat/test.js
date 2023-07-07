// document.getElementById('sendBtn').addEventListener('click', () => {
//     const message = document.getElementById('message');

//     sendMessage();
//     message.value = '';
// });

// let sock = new SockJS("http://localhost:8088/echo/");
// sock.onmessage = onMessage;
// sock.onclose = onClose;

// // 메시지 전송
// function sendMessage() {
//     const message = document.getElementById('message');

//     sock.send(message.value);
// }

// // 서버로부터 메시지를 받았을때
// function onMessage(msg) {
//     const messageArea = document.getElementById('messageArea');

//     var data = msg.data;
//     // messageArea.append(data + `<br>`)
//     messageArea.innerHTML += data + '<br>';
// }

// function onClose(e) {
//     const messageArea = document.getElementById('messageArea');

//     messageArea.append("연결 끊김");
// }

// ==================================================================

// const messageArea = document.getElementById('messageArea');
// const message = document.getElementById('message');

// let sock = new SockJS("http://localhost:8088/echo/");
// sock.onopen = onOpen;
// sock.onmessage = onMessage;
// sock.onclose = onClose;

// function onOpen() {
//     const message = document.getElementById('message');

//     sendMessage('${param.bang_id}', 'CMD_ENTER', message.value);
//     message.value = '';
// }

// function sendMessage(band_id, cmd, msg) {
//     var msgData = {
//         bang_id: bang_id,
//         cmd: cmd,
//         msg: msg
//     };

//     var jsonData = JSON.stringify(msgData);
//     sock.send(jsonData);
// }

// function onMessage(msg) {

//     var data = msg.data;
//     // messageArea.append(data + `<br>`)
//     messageArea.innerHTML += data + '<br>';
// }

// function onClose() {
//     const messageArea = document.getElementById('messageArea');

//     messageArea.append("연결 끊김");
// }

// document.getElementById('btnSend').addEventListener('click', () => {
//     const message = document.getElementById('message');

//     WebSocket.sendMessage();
//     message.value = '';

// });

// document.getElementById('btnSend').addEventListener('click', () => {
//     const message = document.getElementById('message');

//     WebSocket.sendMessage();
//     message.value = '';

// });

// ==================================================================

// var webSocket = {
//     init: function(param) {
//         this._url = param.url;
//         this._initSocket();
//     },
//     sendChat: function() {
//         this._sendMessage('${param.bang_id}', 'CMD_MSG_SEND', $('#message').val());
//         $('#message').val('');
//     },
//     sendEnter: function() {
//         this._sendMessage('${param.bang_id}', 'CMD_ENTER', $('#message').val());
//         $('#message').val('');
//     },
//     receiveMessage: function(msgData) {
//         // 정의된 CMD 코드에 따라서 분기 처리
//         if(msgData.cmd == 'CMD_MSG_SEND') {					
//             $('#divChatData').append('<div>' + msgData.msg + '</div>');
//         }
//         // 입장
//         else if(msgData.cmd == 'CMD_ENTER') {
//             $('#divChatData').append('<div>' + msgData.msg + '</div>');
//         }
//         // 퇴장
//         else if(msgData.cmd == 'CMD_EXIT') {					
//             $('#divChatData').append('<div>' + msgData.msg + '</div>');
//         }
//     },
//     closeMessage: function(str) {
//         $('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
//     },
//     disconnect: function() {
//         this._socket.close();
//     },
//     _initSocket: function() {
//         this._socket = new SockJS(this._url);
//         this._socket.onopen = function(evt) {
//             webSocket.sendEnter();
//         };
//         this._socket.onmessage = function(evt) {
//             webSocket.receiveMessage(JSON.parse(evt.data));
//         };
//         this._socket.onclose = function(evt) {
//             webSocket.closeMessage(JSON.parse(evt.data));
//         }
//     },
//     _sendMessage: function(bang_id, cmd, msg) {
//         var msgData = {
//                 bang_id : bang_id,
//                 cmd : cmd,
//                 msg : msg
//         };
//         var jsonData = JSON.stringify(msgData);
//         this._socket.send(jsonData);
//     }
// };