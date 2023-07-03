package com.myweb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@GetMapping("signin")
	public void signin() {

	}
	
	@GetMapping("signup")
	public void signup() {
	
	}
	
	@GetMapping("detail")
	public void detail() {
		
	}
	
	@GetMapping("modify")
	public void modify() {
		
	}

}
