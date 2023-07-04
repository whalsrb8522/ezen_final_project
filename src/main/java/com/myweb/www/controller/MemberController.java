package com.myweb.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.cj.log.Log;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService msv;

	@GetMapping("/signin")
	public String signin() {
		log.info("로그인 페이지로 이동");
		return "/member/signin";
	}
	
	@PostMapping("/signin")
	public String signinPost(Model m, String m_mail, String m_pw, HttpServletRequest request) {
//		log.info("m_mail"+m_mail, "m_pw"+m_pw)
		MemberVO isMember = MemberService.isMember(m_mail,m_pw);
		
		
		return "/";
	}
	
	@GetMapping("signup")
	public String signup() {
		
		return "/member/signup";
	
	}
	
	@GetMapping("detail")
	public void detail() {
		
	}
	
	@GetMapping("modify")
	public void modify() {
		
	}

}
