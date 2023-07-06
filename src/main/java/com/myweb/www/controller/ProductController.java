package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Inject
	private ProductService psv;
	
	
	@GetMapping("/list")
	public void list(ProductPagingVO ppvo, Model m) {
		List<ProductVO> productList = psv.productList(ppvo);
		m.addAttribute("productList", productList);
		int totalCount = psv.getTotalCount(ppvo);
	}
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String postRegister() {
		return "";
	}
	
	@GetMapping("/detail")
	public void detail() {}
	
	@GetMapping("/modify")
	public void modify() {}
	
	
	
	
}
