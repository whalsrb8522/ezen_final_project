package com.myweb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@GetMapping("/list")
	public void list() {}
	
	@GetMapping("/register")
	public void register() {}
	
	@GetMapping("/detail")
	public void detail() {}
	
	@GetMapping("/modify")
	public void modify() {}
	
	
	
	
}
