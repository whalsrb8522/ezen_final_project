package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.ProductReviewDTO;
import com.myweb.www.domain.ProductReviewVO;

public interface ProductReviewDAO {

	List<ProductReviewVO> selectPrvo(int p_number);

	int insertReview(ProductReviewVO productReviewVO);

	List<ProductReviewVO> selectReviewList(int m_number);


}
