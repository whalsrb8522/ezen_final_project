package com.myweb.www.service;

import com.myweb.www.domain.MemberVO;

public interface MemberService {

	int signUp(MemberVO member);

	MemberVO isMember(String m_mail, String m_pw);

	int nicknameCheck(String m_nick_name);




	
	
}
