package com.myweb.www.repository;

import com.myweb.www.domain.MemberImageVO;

public interface MemberImageDAO {

	int insertMemberImage(MemberImageVO mivo);

	MemberImageVO selectMemberImage(int m_number);

}
