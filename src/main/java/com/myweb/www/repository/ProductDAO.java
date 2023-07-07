package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;

public interface ProductDAO {

	List<ProductVO> productist(ProductPagingVO ppvo);

	List<ProductVO> productList(ProductPagingVO ppvo);

	int getTotalCount(ProductPagingVO ppvo);

	int insertProductRegister(ProductVO pvo);

	int selectPnumber();

}
