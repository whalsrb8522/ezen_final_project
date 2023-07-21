package com.myweb.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.ChatMessageDTO;
import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.domain.ChatRoomDTO;
import com.myweb.www.domain.ChatRoomVO;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.repository.ChatDAO;
import com.myweb.www.repository.MemberDAO;
import com.myweb.www.repository.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatServiceImpl implements ChatService {
	
	@Inject
	private ChatDAO cdao;
	@Inject
	private MemberDAO mdao;
	@Inject
	private ProductDAO pdao;

	@Override
	public List<ChatRoomDTO> getChatList(MemberVO sesMvo) {
		List<ChatRoomDTO> listCdto = new ArrayList<ChatRoomDTO>();
		
		List<ChatRoomVO> listCrvo = cdao.selectChatRoom(sesMvo);
		
		for(ChatRoomVO crvo : listCrvo) {
			String lastMessage = cdao.selectLastMessage(crvo);
			MemberVO sender_mvo = mdao.selectMemberWithNumber(crvo.getCr_seller());
			MemberVO receiver_mvo = mdao.selectMemberWithNumber(crvo.getCr_buyer());
			
			listCdto.add(new ChatRoomDTO(crvo, lastMessage, sender_mvo, receiver_mvo));
		}
		
		return listCdto;
	}
	
	@Override
	public ChatMessageDTO getMessage(int cr_number) {
		ChatMessageDTO cmdto = new ChatMessageDTO();

		cmdto.setMvo(mdao.selectMemberWithNumber(cdao.selectBuyer(cr_number)));
		cmdto.setPvo(pdao.selectProductWithNumber(cr_number));
		cmdto.setListCmvo(cdao.selectMessage(cr_number));

		log.info(">>> getMessage() > cmdto.mvo = " + cmdto.getMvo().toString());
		log.info(">>> getMessage() > cmdto.pvo = " + cmdto.getPvo().toString());
		log.info(">>> getMessage() > cmdto.listCmvo = " + cmdto.getListCmvo().toString());
		
		return cmdto;
	}

	@Override
	public void insertMessage(ChatMessageVO cmvo) {
		cdao.insertMessage(cmvo);
		cdao.updateSendDate(cmvo);
	}

	@Override
	public void registerChatRoom(ChatRoomVO crvo) {
		cdao.insertChatRoom(crvo);
	}

}
