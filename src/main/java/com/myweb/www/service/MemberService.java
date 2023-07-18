package com.myweb.www.service;

import com.myweb.www.domain.MemberDTO;
import com.myweb.www.domain.MemberVO;

public interface MemberService {

	//int signUp(MemberVO member);

	MemberVO isMember(String m_mail, String m_pw);

	int nicknameCheck(String m_nick_name);

	//int register(MemberDTO mdto);

	int signUp(MemberDTO mdto);
	
	//detail페이지
	MemberDTO getMemberDetails(int m_number);

}
