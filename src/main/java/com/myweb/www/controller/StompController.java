package com.myweb.www.controller;

import javax.inject.Inject;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StompController {
	
	@Inject
    private final SimpMessagingTemplate messagingTemplate = null;
	@Inject ChatService csvc;
    	
    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessageVO cmvo) {
        System.out.println("연결성공");
        cmvo.setCm_content(cmvo.getCm_sender() + "님이 채팅방에 참여하셨습니다.");
        messagingTemplate.convertAndSend("/sub/chat/main/" + cmvo.getCr_number(), cmvo);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessageVO cmvo) {
    	log.info(">>> message() > cmvo.cr_number = " + cmvo.getCr_number());
    	log.info(">>> message() > cmvo = " + cmvo.toString());
    	
    	csvc.insertMessage(cmvo);
        messagingTemplate.convertAndSend("/sub/chat/main/"+ cmvo.getCr_number(), cmvo);
    }

}
