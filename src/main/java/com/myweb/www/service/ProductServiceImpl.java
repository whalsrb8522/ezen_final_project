package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.repository.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	private ProductDAO pdao;

	@Override
	public List<ProductVO> productList(ProductPagingVO ppvo) {
		// TODO Auto-generated method stub
		return pdao.productList(ppvo);
	}

	@Override
	public int getTotalCount(ProductPagingVO ppvo) {
		// TODO Auto-generated method stub
		return pdao.getTotalCount(ppvo);
	}
	
}
