package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.ChatDTO;
import com.myweb.www.domain.ChatMessageVO;

public interface ChatService {

	List<ChatDTO> getChatList();

	List<ChatMessageVO> getMessage(int cr_number);

}
