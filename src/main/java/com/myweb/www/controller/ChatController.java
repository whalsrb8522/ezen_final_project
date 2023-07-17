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

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/chat/*")
public class ChatController {
	
	@Inject
	private ChatService csvc;
	
	//채팅방 목록 조회
    @GetMapping(value = "/main")
    public void main(Model m, HttpSession ses) {
    	MemberVO sesMvo = (MemberVO) ses.getAttribute("ses");
    	m.addAttribute("listCdto", csvc.getChatList(sesMvo));
    }
    
    @GetMapping(value = "/list", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<List<ChatDTO>> list(HttpSession ses) {
    	MemberVO sesMvo = (MemberVO) ses.getAttribute("ses");
    	List<ChatDTO> listCdto = csvc.getChatList(sesMvo);
    	log.info(">>> list() > listCdto = " + listCdto.toString());
    	
		return new ResponseEntity<List<ChatDTO>>(listCdto, HttpStatus.OK);
    }
    
	/*
	 * //채팅방 개설
	 * 
	 * @PostMapping(value = "/room") public String create(@RequestParam String name,
	 * RedirectAttributes rttr){		// 매개변수로는 상품번호를 넣을것
	 * rttr.addFlashAttribute("roomName", csvc.createChatRoom(""); return
	 * "redirect:/chat/rooms"; }
	 */
    
    //채팅방 조회
	@GetMapping(value = "/view/{cr_number}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<ChatMessageVO>> view(@PathVariable("cr_number")int cr_number) {
		List<ChatMessageVO> listCmvo = csvc.getMessage(cr_number);
		
		return new ResponseEntity<List<ChatMessageVO>>(listCmvo, HttpStatus.OK);
	}
	
}
