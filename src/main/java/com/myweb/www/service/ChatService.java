package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.ChatRoomDTO;
import com.myweb.www.domain.ChatMessageDTO;
import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.domain.MemberVO;

public interface ChatService {

	List<ChatRoomDTO> getChatList(MemberVO sesMvo);

	ChatMessageDTO getMessage(int cr_number);

	void insertMessage(ChatMessageVO cmvo);

}
