package com.myweb.www.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.myweb.www.domain.MemberDTO;
import com.myweb.www.domain.MemberVO;

public interface MemberService {



	MemberVO isMember(String m_mail, String m_pw);
	//닉네임 중복체크
	int nicknameCheck(String m_nick_name);
	//이메일 중복체크
	ResponseEntity<Integer> emailCheck(String m_mail);

	int signUp(MemberDTO mdto);
	
	//detail페이지
	MemberDTO getMemberDetails(int m_number);
	
	//modify
	void updateMember(MemberDTO memberDTO);

	int updateMemberStatus(Map<String, Object> params);
	

	







}
