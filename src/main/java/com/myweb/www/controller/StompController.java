package com.myweb.www.controller;

import javax.inject.Inject;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketSession;

import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StompController {
	@Inject
    private final SimpMessagingTemplate messagingTemplate = null;
	@Inject 
	ChatService csvc;

    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessageVO cmvo, WebSocketSession session) {
        messagingTemplate.convertAndSend("/sub/chat/enter/" + cmvo.getCr_number(), cmvo);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessageVO cmvo) {
    	log.info(">>> message() > cmvo.cr_number = " + cmvo.getCr_number());
    	log.info(">>> message() > cmvo = " + cmvo.toString());
    	
    	if (cmvo.getCm_type().equals("t")) {
    		csvc.insertTextMessage(cmvo);
    	} else if (cmvo.getCm_type().equals("i")) {
    		csvc.insertImageMessage(cmvo);
    	}
        messagingTemplate.convertAndSend("/sub/chat/main/" + cmvo.getCr_number(), cmvo);
    }

}
