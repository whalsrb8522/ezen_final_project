package com.myweb.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductImageVO;
import com.myweb.www.domain.ProductLikeVO;
import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.repository.ProductDAO;
import com.myweb.www.repository.ProductImageDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	private ProductDAO pdao;
	@Inject
	private ProductImageDAO pidao;


	@Override
	public int getTotalCount(ProductPagingVO ppvo) {
		// TODO Auto-generated method stub
		return pdao.getTotalCount(ppvo);
	}

	@Override
	public int productRegister(ProductDTO pdto) {
		int isOk = pdao.insertProductRegister(pdto.getPvo());
		if(pdto.getPiList()!=null) {
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

	@Override
	public List<ProductDTO> listFile(ProductPagingVO ppvo) {
		List<ProductDTO> listPdto = new ArrayList<ProductDTO>();
		List<ProductVO> listPvo = pdao.selectProduct(ppvo);
		for(ProductVO pvo : listPvo) {
			List<ProductImageVO> piList = pidao.selectFileList(pvo);
			
			listPdto.add(new ProductDTO(pvo, piList));
		}
		
		return listPdto;
	}

	@Override
	public ProductDTO detail(int p_number) {
		ProductDTO pdto = new ProductDTO();
		pdto.setPvo(pdao.selectPno(p_number));
		pdto.setPiList(pidao.selectFile(p_number));
		return pdto;
	}

	@Override
	public int updateStatus(ProductVO pvo) {
		int isOk = pdao.updateStatus(pvo);
		log.info(">> serviceImpl > "+(isOk>0?"성공":"실패"));
		return isOk;
	}

	@Override
	public int readCount(int p_number) {
		int isOk = pdao.updateReadCount(p_number);
		log.info(">> readcount > "+(isOk>0?"성공":"실패"));
		return isOk;
	}

	@Override
	public boolean insertLikeMember(ProductLikeVO plvo) {
		ProductLikeVO existingLikes = pdao.getLikeRecord(plvo);
		log.info("existingLikes 결과값"+existingLikes);
		if(existingLikes == null) {
			int isOk = pdao.insertLikeMember(plvo);
			if (isOk > 0) {
				pdao.updateLike(plvo.getP_number());
				log.info(">> 찜 > "+(isOk>0?"성공":"실패"));
				return true;
			}
		} else {
			pdao.deleteLikeMember(plvo);
			pdao.updateUnlike(plvo.getP_number());
			return false;
		}
		return false;
	}
	
}
