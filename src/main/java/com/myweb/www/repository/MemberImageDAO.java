package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.MemberImageVO;
import com.myweb.www.domain.ProductReviewVO;

public interface MemberImageDAO {

	int insertMemberImage(MemberImageVO mivo);

	MemberImageVO selectMemberImage(int m_number);

	void updateMemberImage(MemberImageVO mivo);

	// 작성자 : 김경아
	List<MemberImageVO> selectMivo(int m_number);
}
