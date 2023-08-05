package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardLocationImageVO;
import com.myweb.www.domain.BoardLocationVO;

public interface BoardLocationImageDAO {

	List<BoardLocationImageVO> selectBoardLocationFile(BoardLocationVO blvo);

	int insertBoardLocationImage(BoardLocationImageVO blivo);

}
