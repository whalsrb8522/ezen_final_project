package com.myweb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board_location/*")
public class BoardLocationController {

	@GetMapping("list")
	public void list() {}
		
	@GetMapping("register")
	public void register() {}
	
	@GetMapping("detail")
	public void detail() {}
}