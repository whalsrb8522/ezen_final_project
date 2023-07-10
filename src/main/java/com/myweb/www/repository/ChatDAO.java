package com.myweb.www.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.domain.ChatRoomVO;

@Repository
public interface ChatDAO {

	public List<ChatRoomVO> selectChatRoom();

	public ChatMessageVO selecLastMessage(ChatRoomVO crvo);

}
