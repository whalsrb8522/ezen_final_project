package com.myweb.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/*")
@Controller
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
	
	
	 //닉네임 중복체크
	 
	@PostMapping("/nicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("m_nick_name") String m_nick_name) {
		log.info("Checking nickname: " + m_nick_name);
	    return memberService.nicknameCheck(m_nick_name);
	}
	
	//로그인
	@GetMapping("/signin")
	public String signinGet() {
		
		return "/member/signin";
	}
	
	@PostMapping("/signin")
	public String signinPost(Model m, String m_mail, String m_pw, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    log.info("-=-=> id : "+m_mail+", "+"pw : "+m_pw);
	    MemberVO isMember = memberService.isMember(m_mail, m_pw);
	    
	    if(isMember != null) {
	        HttpSession ses = request.getSession();
	        ses.setAttribute("ses", isMember); //세션에 객체 담기
	        ses.setMaxInactiveInterval(60*180); //로그인 유지 시간 : 현재 3시간
	        m.addAttribute("member", isMember);
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "아이디 혹은 비밀번호를 잘못입력하셨습니다.");
	        return "redirect:/member/signin";
	    }
	    return "home";
	}
	
	//로그아웃
	@GetMapping("/signout")
	public String signout(Model m, HttpServletRequest request) {
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
