package com.myweb.www.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myweb.www.domain.ChatMessageVO;
import com.myweb.www.domain.ChatRoomVO;
import com.myweb.www.domain.MemberVO;

@Repository
public interface ChatDAO {

	public List<ChatRoomVO> selectChatRoom();

	public String selectLastMessage(ChatRoomVO crvo);

	public List<ChatMessageVO> selectMessage(int cr_number);

	public List<ChatRoomVO> selectChatRoom(MemberVO sesMvo);

	public void insertMessage(ChatMessageVO cmvo);

}
