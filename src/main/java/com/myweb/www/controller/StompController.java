package com.myweb.www.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;

import com.myweb.www.domain.ChatMessageVO;

public class StompController {
    private final SimpMessagingTemplate messagingTemplate = null;

    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessageVO cmvo) {
        System.out.println("연결성공");
        cmvo.setCm_content(cmvo.getCm_sender() + "님이 채팅방에 참여하셨습니다.");
        messagingTemplate.convertAndSend("/sub/chat/room/" + cmvo.getCr_number(), cmvo);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessageVO cmvo) {
        messagingTemplate.convertAndSend("/sub/chat/room/"+ cmvo.getCr_number(), cmvo);
    }
}
