var webSocket = {
    url: null,
    socket: null,

    init: function(param) {
        this.url = param.url;
        this._initSocket();
    },

    sendChat: function() {
        this._sendMessage(bang_id, 'CMD_MSG_SEND', document.getElementById('message').value);
        document.getElementById('message').value = '';
    },

    sendEnter: function() {
        this._sendMessage(bang_id, 'CMD_ENTER', document.getElementById('message').value);
        document.getElementById('message').value = '';
    },

    receiveMessage: function(msgData) {
        if (msgData.cmd == 'CMD_MSG_SEND') {
            var divChatData = document.getElementById('divChatData');
            var div = document.createElement('div');
            div.textContent = msgData.msg;
            divChatData.appendChild(div);
        } else if (msgData.cmd == 'CMD_ENTER' || msgData.cmd == 'CMD_EXIT') {
            var divChatData = document.getElementById('divChatData');
            var div = document.createElement('div');
            div.textContent = msgData.msg;
            divChatData.appendChild(div);
        }
    },

    closeMessage: function(str) {
        var divChatData = document.getElementById('divChatData');
        var div = document.createElement('div');
        div.textContent = '연결 끊김: ' + str;
        divChatData.appendChild(div);
    },

    disconnect: function() {
        this.socket.close();
    },

    _initSocket: function() {
        this.socket = new SockJS(this.url);

        var self = this;
        this.socket.onopen = function(evt) {
            self.sendEnter();
        };

        this.socket.onmessage = function(evt) {
            self.receiveMessage(JSON.parse(evt.data));
        };

        this.socket.onclose = function(evt) {
            self.closeMessage(evt.data);
        };
    },

    _sendMessage: function(bang_id, cmd, msg) {
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
