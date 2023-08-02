package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardLocationPagingVO;
import com.myweb.www.domain.BoardLocationVO;

public interface BoardLocationDAO {

	List<BoardLocationVO> selectBoardLocation(BoardLocationPagingVO blpvo);

	int getTotalCount(BoardLocationPagingVO blpvo);

	int insertBoardLocationRegister(BoardLocationVO blvo);

	int selectBlnumber();

}
