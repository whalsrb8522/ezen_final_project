package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;

public interface ProductService {

	List<ProductVO> productList(ProductPagingVO ppvo);

	int getTotalCount(ProductPagingVO ppvo);
}
