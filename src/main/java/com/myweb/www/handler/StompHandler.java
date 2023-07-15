//package com.myweb.www.handler;
//
//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.myweb.www.domain.ChatMessageVO;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@RestController
//public class StompHandler {
//
//	@MessageMapping("/chat/message")
//	public ChatMessageVO message(ChatMessageVO cmvo) {
//		log.info(">>> message()");
//		log.info(">>> message() > cmvo = " + cmvo.toString());
//		
//		return cmvo;
//	}
//	
//}
