package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.ChatDTO;
import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.domain.MemberVO;

public interface ChatService {

	List<ChatDTO> getChatList(MemberVO sesMvo);

	List<ChatMessageVO> getMessage(int cr_number);

	void insertMessage(ChatMessageVO cmvo);

}
