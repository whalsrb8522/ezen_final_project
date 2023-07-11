package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductImageVO;
import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;

public interface ProductService {

	int getTotalCount(ProductPagingVO ppvo);

	int productRegister(ProductDTO pdto);

	List<ProductDTO> listFile(ProductPagingVO ppvo);

	
}
