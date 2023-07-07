package com.myweb.www.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mdao;
	@Inject
	BCryptPasswordEncoder passwordencoder;

	@Override
	public int signUp(MemberVO member) {
		log.info("---> 회원가입(signup) Service 진입");
		MemberVO tempMember = mdao.getMember(member.getM_mail());
		
		if(tempMember != null) {
			return 0;
		}
		
		if(member.getM_mail() == null || member.getM_mail().length() == 0) {
			return 0;
		}
		
		if(member.getM_pw() == null || member.getM_pw().length() == 0) {
			return 0;
		}
		
		//회원가입 진행
		String m_pw = member.getM_pw();
		
		//encode(암호화) / matches(원래 비번, 암호화된 비번)
		String encodeM_pw = passwordencoder.encode(m_pw); // 기존 패스워드 암호화
		member.setM_pw(encodeM_pw);
		
		
		int isOk = mdao.insertMember(member);
		
		return isOk;
	}

	@Override
	public MemberVO isMember(String m_mail, String m_pw) {
		log.info("---> 로그인(signin) Service 진입");
		MemberVO member = mdao.getMember(m_mail);
		
		//m_mail이 일치하는 객체가 없을 경우
		if(member == null) { return null; }
		
		//원래 pw와 암호화된 pw가 매치가 된다면 true
		if(passwordencoder.matches(m_pw, member.getM_pw())) {
			return member;
		}else {
			return null;
			
		}
		
	}


}
