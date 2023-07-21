package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductLikeVO;
import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;

public interface ProductDAO {

	int getTotalCount(ProductPagingVO ppvo);

	int insertProductRegister(ProductVO pvo);

	int selectPnumber();

	List<ProductVO> selectProduct(ProductPagingVO ppvo);

	ProductVO selectPno(int p_number);

	int updateStatus(ProductVO pvo);

	// 채팅 기능 구현 (작성자 : 조민규)	
	ProductVO selectProductWithNumber(int cr_number);

	int updateReadCount(int p_number);

	int insertLikeMember(ProductLikeVO plvo);

	void updateLike(int p_number);

}
