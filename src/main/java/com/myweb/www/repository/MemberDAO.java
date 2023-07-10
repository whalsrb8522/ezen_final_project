package com.myweb.www.repository;

import org.springframework.stereotype.Repository;

import com.myweb.www.domain.MemberVO;

@Repository
public interface MemberDAO {

	MemberVO getMember(String m_mail);

	int insertMember(MemberVO member);

	int nameCheck(String m_nick_name);

	int nicknameCheck(String m_nick_name);

	


	
	 




}
