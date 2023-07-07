package com.myweb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

	@GetMapping("test")
	public void test() {}
	
	@GetMapping("main")
	public void main() {}
	
}
