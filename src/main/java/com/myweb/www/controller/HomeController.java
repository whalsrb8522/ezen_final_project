package com.myweb.www.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductPagingVO;
import com.myweb.www.handler.ProductPagingHandler;
import com.myweb.www.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	@Inject
	private ProductService psv;

	// 오늘의 상품 list 불러오기 (작성자 : 김경아)
	@GetMapping("/")
	public String list(ProductPagingVO ppvo, Model m) {
		List<ProductDTO> pdto = psv.listFile(ppvo);
		m.addAttribute("productList", pdto);
		return "home";
		
	}

	@GetMapping("css_test")
	public void css_test() {}
}
