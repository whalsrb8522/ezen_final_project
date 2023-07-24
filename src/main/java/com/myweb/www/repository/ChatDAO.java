package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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

	public void updateSendDate(ChatMessageVO cmvo);

	public int selectBuyer(int cr_number);

	public int insertChatRoom(ChatRoomVO crvo);

	public void updateReadDate(@Param("cr_number")int cr_number, 
			@Param("m_number")int m_number);

}
