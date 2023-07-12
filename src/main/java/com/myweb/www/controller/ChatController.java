package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.ChatDTO;
import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Slf4j
public class ChatController {
	
	@Inject
	private ChatService csvc;

	@GetMapping("main")
	public void main(Model m, HttpSession ses) {
		List<ChatDTO> listCdto = csvc.getChatList();
		
		m.addAttribute("listCdto", listCdto);
	}
	
	@GetMapping(value = "view/{cr_number}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ChatMessageVO>>  view(@PathVariable("cr_number")int cr_number) {
		List<ChatMessageVO> listCmvo = csvc.getMessage(cr_number);
		
		log.info(">>> listCmvo : " + listCmvo.toString());
		
		return new ResponseEntity<List<ChatMessageVO>>(listCmvo, HttpStatus.OK);
	}
	
}
