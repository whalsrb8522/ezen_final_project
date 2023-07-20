package com.myweb.www.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductImageVO;
import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.handler.ProductImageHandler;
import com.myweb.www.handler.ProductPagingHandler;
import com.myweb.www.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Inject
	private ProductService psv;
	@Inject
	private ProductImageHandler pihd;
	
	
	
	@GetMapping("/list")
	public void list(ProductPagingVO ppvo, Model m) {
		m.addAttribute("ppvo",ppvo);
		List<ProductDTO> pdto = psv.listFile(ppvo);
		m.addAttribute("productList", pdto);
		int totalCount = psv.getTotalCount(ppvo);
		ProductPagingHandler pph = new ProductPagingHandler(ppvo, totalCount);
		m.addAttribute("pph", pph);
	}
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String postRegister(RedirectAttributes rAttr, ProductVO pvo, @RequestParam(name="files")MultipartFile[] files) {
		List<ProductImageVO> piList = null;
		if(files[0].getSize()>0) {
			piList = pihd.uploadFiles(files);
		}
		ProductDTO pdto = new ProductDTO(pvo, piList);
		int isOk = psv.productRegister(pdto);
		rAttr.addFlashAttribute("isOk", isOk);
		return "redirect:/product/list";
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam("p_number")int p_number, Model m) {
		// readCount 추가
		psv.readCount(p_number);
		ProductDTO pdto = psv.detail(p_number);
		m.addAttribute("pdto", pdto);
	}
	
	@PostMapping(value = "/detail", consumes = "application/json")
	public void postDetail(@RequestBody ProductVO pvo) {
		psv.updateStatus(pvo);
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("p_number")int p_number, Model m) {
		ProductDTO pdto = psv.detail(p_number);
		m.addAttribute("pdto", pdto);
	}
	
	
	
	
	
}
