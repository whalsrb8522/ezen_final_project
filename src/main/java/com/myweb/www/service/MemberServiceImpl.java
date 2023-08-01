package com.myweb.www.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.MemberDTO;
import com.myweb.www.domain.MemberImageVO;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductImageVO;
import com.myweb.www.repository.MemberDAO;
import com.myweb.www.repository.MemberImageDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mdao;
	@Inject
	private MemberImageDAO midao;

	@Inject
    BCryptPasswordEncoder passwordEncoder;
	private ProductService psv;
	
	@Override
	@Transactional
	public int signUp(MemberDTO mdto) {
	    log.info("---> 회원가입(signup) Service 진입");

	    MemberVO member = mdto.getMvo();
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
	    String encodeM_pw = passwordEncoder.encode(m_pw); // 기존 패스워드 암호화
	    member.setM_pw(encodeM_pw);

	    int isOk = mdao.insertMember(member);
	    if (isOk <= 0) {
	        log.error("Failed to insert member");
	        return 0;
	    }

	    // 회원 정보 가져오기
	    MemberVO insertedMember = mdao.getNewMember(member.getM_mail());
	    if (insertedMember == null) {
	        log.error("Unable to get new member");
	        return 0;
	    }
	    int m_number = insertedMember.getM_number();

	    // 회원 이미지 등록
	    if(mdto.getMivo() != null && isOk > 0) {
	        MemberImageVO mivo = mdto.getMivo();
	        if(mivo == null) { // uploadFile에서 문제가 발생하여 null이 반환된 경우
	            log.warn("Image upload 실패");
	        } else {
	            mivo.setM_number(m_number);
	            log.info("Inserting file: " + mivo);
	            isOk *= midao.insertMemberImage(mivo);
	        }
	    }

	    return isOk;
	}

	
	
	//로그인
	@Override
	public MemberVO isMember(String m_mail, String m_pw) {
		log.info("---> 로그인(signin) Service 진입");
		MemberVO member = mdao.getMember(m_mail);
		
		//m_mail이 일치하는 객체가 없을 경우
		if(member == null) { return null; }
		
		//원래 pw와 암호화된 pw가 매치가 된다면 true
		if(passwordEncoder.matches(m_pw, member.getM_pw())) {
			return member;
		}else {
			return null;
			
		}
		
	}
	//닉네임 중복체크
	@Override
	public int nicknameCheck(String m_nick_name) {
		// TODO Auto-generated method stub
		int count =  mdao.nicknameCheck(m_nick_name);
		return (count == 0) ? 0 : 1;
	}
	
	//이메일 중복체크
	@Override
	public int emailCheck(String m_mail) {
	    int count = mdao.emailCheck(m_mail);
	    return (count == 0) ? 0 : 1;
	}



	//detail페이지
	@Override
	public MemberDTO getMemberDetails(int m_number) {
		MemberDTO memberDetails = new MemberDTO();
		memberDetails.setMvo(mdao.selectMemberWithNumber(m_number));
		memberDetails.setMivo(midao.selectMemberImage(m_number));
		
	    
		return memberDetails;
	}



	//modify
	
		@Override
		public void updateMember(MemberDTO memberDTO) {
		    try {
		        MemberVO member = memberDTO.getMvo();

		        if(member.getM_pw() == null || member.getM_pw().length() == 0) {
		            throw new IllegalArgumentException("Password can't be null or empty.");
		        }

		        // Encoding the password
		        String m_pw = member.getM_pw();
		        String encodedM_pw = passwordEncoder.encode(m_pw); // new password is encrypted
		        member.setM_pw(encodedM_pw); // encrypted password is set

		        mdao.updateMember(member); // update member with the encrypted password

		        // Fetch the updated member
		        MemberVO updatedMember = mdao.getMember(member.getM_mail());

		        // Check the password
		        if (passwordEncoder.matches(m_pw, updatedMember.getM_pw())) {
		            log.info("Password updated correctly");
		        } else {
		            log.error("Password didn't update correctly");
		        }

		        if(memberDTO.getMivo() != null) {
		            midao.updateMemberImage(memberDTO.getMivo());
		        }
		    } catch (Exception e) {
		        log.error("Error in updating member", e);
		        throw new RuntimeException("Error in updating member", e);
		    }
		}






	@Override
	public int updateMemberStatus(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mdao.updateMemberStatus(params);
	}


	


	 


}
