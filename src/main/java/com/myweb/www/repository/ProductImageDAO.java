package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.ProductImageVO;
import com.myweb.www.domain.ProductVO;

public interface ProductImageDAO {

	int insertProductImage(ProductImageVO pivo);

	List<ProductImageVO> selectFileList(ProductVO pvo);

}
