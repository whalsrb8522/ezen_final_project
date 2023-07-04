package com.myweb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Slf4j
public class ChatController {
	
	@GetMapping("main")
	public void main() {}

	@GetMapping("test")
	public void test() {}
}
