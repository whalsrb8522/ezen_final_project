package com.myweb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board_notice/*")
public class BoardNoticeController {

	@GetMapping("list")
	public void list() {}
	
}

