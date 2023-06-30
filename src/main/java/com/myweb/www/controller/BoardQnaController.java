package com.myweb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board_qna/*")
public class BoardQnaController {

	@GetMapping("list")
	public void list() {}
}
