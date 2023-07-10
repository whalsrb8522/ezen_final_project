package com.myweb.www.repository;

import com.myweb.www.domain.ChatRoomVO;
import com.myweb.www.domain.MemberVO;

public interface MemberDAO {

	MemberVO getMember(String m_mail);

	int insertMember(MemberVO member);

	MemberVO selectMemberWithNumber(int m_number);

	MemberVO selectMemberWithNumber(ChatRoomVO crvo);

	/*
	 * int nickCheck(String nickName);
	 */

}
