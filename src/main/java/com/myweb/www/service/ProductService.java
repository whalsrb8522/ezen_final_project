package com.myweb.www.service;

import java.util.List;

import org.springframework.lang.Nullable;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductLikeVO;
import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;

public interface ProductService {

	int getTotalCount(ProductPagingVO ppvo);

	int productRegister(ProductDTO pdto);

	List<ProductDTO> listFile(ProductPagingVO ppvo);

	ProductDTO detail(int p_number);
	ProductDTO detail(int p_number, int sesM_number);

	int updateStatus(ProductVO pvo);

	int readCount(int p_number);

	boolean insertLikeMember(ProductLikeVO plvo);

	int updateModify(ProductDTO pdto);

	int removeFile(String pi_uuid);

	int removeIsDel(int p_number);

}
