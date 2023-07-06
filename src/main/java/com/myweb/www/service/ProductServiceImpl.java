package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductImageVO;
import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.repository.ProductDAO;
import com.myweb.www.repository.ProductImageDAO;

@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	private ProductDAO pdao;
	@Inject
	private ProductImageDAO pidao;

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

	@Override
	public int productRegister(ProductDTO pdto) {
		int isOk = pdao.insertProductRegister(pdto.getPvo());
		if(pdto.getPiList()==null) {
			isOk*=1;
		}else {
			if(isOk>0 && pdto.getPiList().size()>0) {
				int p_number = pdao.selectPnumber();
				for(ProductImageVO pivo : pdto.getPiList()) {
					pivo.setP_number(p_number);
					isOk *= pidao.insertProductImage(pivo);
				}
			}
		}
		return isOk;
	}
	
}
