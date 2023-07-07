package com.myweb.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService memberService;

	//회원가입
	@GetMapping("/signup")
	public String index(Model m) {
		log.info("home 접근");
		return "/member/signup";
	
	}
	
	
	@PostMapping("/signup")
	public String signupPost(Model m, MemberVO member) {
		log.info("signUp 접근");
		log.info(member.toString());
		int isOk = memberService.signUp(member);
		if(isOk > 0) {
			m.addAttribute("msg_signup", 1);
		}else {
			m.addAttribute("msg_signup", 0);
		}
		return "home"; 
	}
	
	//로그인
	@GetMapping("/signin")
	public String signin() {
//		log.info("로그인 페이지로 이동");
		return "/member/signin";
	}
	
	@PostMapping("/signin")
	public String signinPost(Model m, String m_mail, String m_pw, HttpServletRequest request) {
		log.info("m_mail : "+m_mail, "m_pw : "+m_pw);
		MemberVO isMember = memberService.isMember(m_mail, m_pw);
		
		if(isMember != null) {
			HttpSession ses = request.getSession();
			ses.setAttribute("ses", isMember); //세션에 객체 담기
			ses.setMaxInactiveInterval(60*10); //로그인 유지 시간
			m.addAttribute("member", isMember);
		}else {
			m.addAttribute("msg_signin", 0);
		}
		return "home";
	}
	
	//로그아웃
	public String logout(Model m, HttpServletRequest request) {
		request.getSession().removeAttribute("ses");
		request.getSession().invalidate();
		m.addAttribute("msg_logout", 1);
		
		return "home";
	}
	
	@GetMapping("detail")
	public void detail() {
		
	}
	
	@GetMapping("modify")
	public void modify() {
		
	}

}
