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
import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductImageVO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.repository.ChatDAO;
import com.myweb.www.repository.MemberDAO;
import com.myweb.www.repository.ProductDAO;
import com.myweb.www.repository.ProductImageDAO;

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
	@Inject
	private ProductImageDAO pidao;

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
	public ChatMessageDTO getMessage(int cr_number, int sessionM_number) {
		log.info(">>> getMessage()");
		log.info(">>> cr_number = " + cr_number);
		log.info(">>> m_number = " + sessionM_number);
		
		ChatMessageDTO cmdto = new ChatMessageDTO();

		MemberVO mvo = new MemberVO();
		ProductDTO pdto = new ProductDTO(
				pdao.selectProductWithNumber(cr_number),
				pidao.selectFile(cr_number));
		List<ChatMessageVO> listCmvo = cdao.selectMessage(cr_number);
		
		if (pdto.getPvo().getM_number() == sessionM_number) {
			mvo = mdao.selectMemberWithNumber(cdao.selectBuyer(cr_number));
		} else {
			mvo = mdao.selectMemberWithNumber(cdao.selectSeller(cr_number));
		}
		
		cmdto.setMvo(mvo);
		cmdto.setPdto(pdto);
		cmdto.setListCmvo(listCmvo);

		cdao.updateReadDate(cr_number, sessionM_number);
		
		return cmdto;
	}

	@Override
	public void insertMessage(ChatMessageVO cmvo) {
		cdao.insertMessage(cmvo);
		cdao.updateSendDate(cmvo);
	}

	@Override
	public int registerChatRoom(ChatRoomVO crvo) {
		return cdao.insertChatRoom(crvo);
		
	}

}
