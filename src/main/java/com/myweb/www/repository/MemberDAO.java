package com.myweb.www.repository;

import com.myweb.www.domain.MemberVO;

public interface MemberDAO {

	MemberVO getMember(String m_mail);

	int insertMember(MemberVO member);

	/*
	 * int nickCheck(String nickName);
	 */




}
