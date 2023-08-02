package com.myweb.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.service.BoardLocationService;

@Controller
@RequestMapping("/board_location/*")
public class BoardLocationController {
	@Inject
	private BoardLocationService blsv;

	@GetMapping("list")
	public void list() {}
		
	@GetMapping("register")
	public void register() {}
	
	@GetMapping("detail")
	public void detail() {}
	
	@GetMapping("modify")
	public void modify() {}
}