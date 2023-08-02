package com.myweb.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.BoardLocationDTO;
import com.myweb.www.domain.BoardLocationImageVO;
import com.myweb.www.domain.BoardLocationPagingVO;
import com.myweb.www.domain.BoardLocationVO;
import com.myweb.www.repository.BoardLocationDAO;
import com.myweb.www.repository.BoardLocationImageDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardLocationServiceImpl implements BoardLocationService {
	@Inject
	private BoardLocationDAO bldao;
	@Inject
	private BoardLocationImageDAO blidao;

	@Override
	public List<BoardLocationDTO> locationList(BoardLocationPagingVO blpvo) {
		List<BoardLocationDTO> listBldto = new ArrayList<BoardLocationDTO>();
		List<BoardLocationVO> listBlvo = bldao.selectBoardLocation(blpvo);
		for(BoardLocationVO blvo : listBlvo) {
			List<BoardLocationImageVO> blivo = blidao.selectBoardLocationFile(blvo);
			listBldto.add(new BoardLocationDTO(blpvo, blivo, null));
		}
		return listBldto;
	}

	@Override
	public int getTotalCount(BoardLocationPagingVO blpvo) {
		// TODO Auto-generated method stub
		return bldao.getTotalCount(blpvo);
	}

	@Override
	public int boardLocationRegister(BoardLocationDTO bldto) {
		int isOk = bldao.insertBoardLocationRegister(bldto.getBlvo());
		if(bldto.getBlivo()!=null) {
			if(isOk>0&&bldto.getBlivo().size()>0) {
				int bl_number = bldao.selectBlnumber();
				for(BoardLocationImageVO blivo : bldto.getBlivo()) {
					blivo.setBl_number(bl_number);
					isOk *= blidao.insertBoardLocationImage(blivo);
				}
			}
		}
		return isOk;
	}
}
