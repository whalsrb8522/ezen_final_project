package com.myweb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board_qna/*")
public class BoardQnaController {

	@GetMapping("list")
	public void list() {}
<<<<<<< HEAD
	
	@GetMapping("register")
	public void register() {}
=======
>>>>>>> 137f27c2450becb7b04bf990d3ea8d9d04c665eb
}
