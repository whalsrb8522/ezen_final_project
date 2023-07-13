package com.myweb.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.ChatDTO;
import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.domain.ChatRoomVO;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.repository.ChatDAO;
import com.myweb.www.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatServiceImpl implements ChatService {
	
	@Inject
	private ChatDAO cdao;
	@Inject
	private MemberDAO mdao;

	@Override
	public List<ChatDTO> getChatList(MemberVO sesMvo) {
		List<ChatDTO> listCdto = new ArrayList<ChatDTO>();
		
		List<ChatRoomVO> listCrvo = cdao.selectChatRoom(sesMvo);
		
		for(ChatRoomVO crvo : listCrvo) {
			String lastMessage = cdao.selectLastMessage(crvo);
			MemberVO sender_mvo = mdao.selectMemberWithNumber(crvo.getCr_seller());
			MemberVO receiver_mvo = mdao.selectMemberWithNumber(crvo.getCr_buyer());
			
			listCdto.add(new ChatDTO(crvo, lastMessage, sender_mvo, receiver_mvo));
		}
		
		return listCdto;
	}
	
	@Override
	public List<ChatMessageVO> getMessage(int cr_number) {
		return cdao.selectMessage(cr_number);
	}

}
