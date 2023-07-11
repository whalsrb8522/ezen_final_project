package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.ChatDTO;
import com.myweb.www.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Slf4j
public class ChatController {
	
	@Inject
	private ChatService csvc;

	@GetMapping("main")
	public void main(Model m) {
		List<ChatDTO> listCdto = csvc.getChatList();
		
		m.addAttribute("listCdto", listCdto);
	}
	
	@GetMapping("test")
	public void test() {}
	
}
