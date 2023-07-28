package com.myweb.www.repository;


import java.util.Map;

import org.springframework.stereotype.Repository;
import com.myweb.www.domain.MemberVO;

@Repository
public interface MemberDAO {

	MemberVO getMember(String m_mail);

	int insertMember(MemberVO member);

	int nameCheck(String m_nick_name);

	int nicknameCheck(String m_nick_name);
	
	MemberVO selectMemberWithNumber(int m_number);

	MemberVO getNewMember(String m_mail);

	
	void updateMember(MemberVO member);
	
	
	// 작성자 : 김경아
	MemberVO getMemberProduct(int m_number);

	int updateMemberStatus(Map<String, Object> params);

	

}
