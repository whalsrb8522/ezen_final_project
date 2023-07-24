package com.myweb.www.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myweb.www.domain.ChatMessageDTO;
import com.myweb.www.domain.ChatRoomDTO;
import com.myweb.www.domain.ChatRoomVO;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.repository.ProductDAO;
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
	@Inject
	private ProductDAO pdao;
	
	//채팅방 목록 조회
    @GetMapping(value = "/main")
    public void main(Model m, HttpSession ses, 
    		@RequestParam(value = "p_number" , required = false)Integer p_number) {
    	log.info(">>> main() > p_number = " + p_number);
    	
    	MemberVO sesMvo = (MemberVO) ses.getAttribute("ses");
    	m.addAttribute("listCdto", csvc.getChatList(sesMvo));
    	m.addAttribute("selectRoomNumber", p_number);
    }
    
    @GetMapping(value = "/list", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<List<ChatRoomDTO>> list(HttpSession ses) {
    	MemberVO sesMvo = (MemberVO) ses.getAttribute("ses");
    	List<ChatRoomDTO> listCdto = csvc.getChatList(sesMvo);
    	log.info(">>> list() > listCdto = " + listCdto.toString());

		return new ResponseEntity<List<ChatRoomDTO>>(listCdto, HttpStatus.OK);
    }
    
    // 채팅방 개설
    @PostMapping(value = "/register")
    public ResponseEntity<Integer> register(@RequestBody Map<String, Integer> chatRegisterData, HttpSession ses) {
    	ProductVO pvo = null;
    	int sessionMemberNumber = 0;
    	
    	for(String key : chatRegisterData.keySet()) {
    		if(key.equals("p_number"))
    			pvo = pdao.selectPno(chatRegisterData.get(key));
    		if(key.equals("sessionMemberNumber" ))
    			sessionMemberNumber = chatRegisterData.get(key);
    	}
    	
		ChatRoomVO crvo = new ChatRoomVO(pvo.getP_number(), pvo.getM_number(), sessionMemberNumber);
		int isOk = csvc.registerChatRoom(crvo);
				
		return new ResponseEntity<Integer>(isOk, HttpStatus.OK);
    } 
    
    //채팅방 조회
	@GetMapping(value = "/view/{cr_number}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<ChatMessageDTO> view(@PathVariable("cr_number")int cr_number, HttpSession ses) {
		log.info(">>> view()");
		MemberVO sesMvo = (MemberVO) ses.getAttribute("ses");
		
		ChatMessageDTO cmdto = csvc.getMessage(cr_number, sesMvo.getM_number());
		
		return new ResponseEntity<ChatMessageDTO>(cmdto, HttpStatus.OK);
	}
	
	// 채팅 수신 확인
	@GetMapping(value="/header")
	public ResponseEntity<Boolean> header() {
		csvc.isReadMessage();
		
		return null;
	}
}
