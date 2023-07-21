package com.myweb.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.MemberDTO;
import com.myweb.www.domain.MemberImageVO;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.handler.MemberImageHandler;
import com.myweb.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private MemberImageHandler mihd;

	//회원가입
	@GetMapping("/signup")
	public String index(Model m) {
		log.info("home 접근");
		return "/member/signup";
	
	}
	
	@PostMapping("/signup")
	public String signupPost(Model m, MemberVO member, 
	                         RedirectAttributes rAttr,
	                         @RequestParam(name="file", required = false) MultipartFile file) {
	    log.info("signUp 접근");
	    log.info(member.toString());

	    MemberImageVO mivo = null;
	    if(file != null && file.getSize() > 0) { 
	        mivo = mihd.uploadFile(file); 
	    } else {
	        log.info("file null");
	    }

	    MemberDTO mdto = new MemberDTO(member, mivo);
	    int isOk = memberService.signUp(mdto);
	    log.info("-=-=> Member image register >>"+ (isOk >0 ? "OK" : "FAIL"));
	    
	    if(isOk > 0) {
	        m.addAttribute("msg_signup", 1);
	        rAttr.addFlashAttribute("isOk", isOk);
	    } else {
	        m.addAttribute("msg_signup", 0);
	    }

	    return "redirect:/";	  
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
	        ses.setAttribute("m_number", isMember.getM_number()); // 로그인한 사용자의 m_number 세션에 저장
	        ses.setMaxInactiveInterval(60*180); //로그인 유지 시간 : 현재 3시간
	        m.addAttribute("member", isMember);
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "아이디 혹은 비밀번호를 잘못입력하셨습니다.");
	        return "redirect:/member/signin";
	    }
	    
	    return "redirect:/";
	}

	
	//로그아웃
	@GetMapping("/signout")
	public String signout(Model m, HttpServletRequest request) {
		request.getSession().removeAttribute("ses");
		request.getSession().invalidate();
		m.addAttribute("msg_logout", 1);
		
		return "home";
	}
	
	// 회원정보
	@GetMapping("/detail")
	public String getMemberDetails(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    Integer m_number = (Integer) session.getAttribute("m_number");
	    
	    MemberDTO member = memberService.getMemberDetails(m_number);
	    if (member != null) {
	        model.addAttribute("member", member);
	        return "/member/detail";
	    } else {
	        return "not-found"; // 회원을 찾지 못한 경우에 대한 예외 처리
	    }
	}


	// 회원정보 수정 페이지
	@GetMapping("/modify")
	public String modifyGet(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    Integer m_number = (Integer) session.getAttribute("m_number");

	    MemberDTO member = memberService.getMemberDetails(m_number);
	    if (member != null) {
	        model.addAttribute("member", member);
	        return "/member/modify";
	    } else {
	        return "not-found"; // 회원을 찾지 못한 경우에 대한 예외 처리
	    }
	}

	// 회원정보 수정 처리
	@PostMapping("/modify")
	public String modifyPost(HttpServletRequest request,
	                         @RequestParam("old_password") String oldPassword,
	                         @RequestParam("new_password") String newPassword,
	                         @RequestParam("nickname") String nickname,
	                         @RequestParam("introduce") String introduce,
	                         @RequestParam(name="file", required = false) MultipartFile file,
	                         Model m, RedirectAttributes rAttr) {
	    HttpSession session = request.getSession();
	    Integer m_number = (Integer) session.getAttribute("m_number");
	    MemberDTO memberDTO = memberService.getMemberDetails(m_number); // 변경된 부분

	    if (memberDTO == null) {
	        return "not-found"; // 회원을 찾지 못한 경우에 대한 예외 처리
	    }

	    MemberVO member = memberDTO.getMvo(); // 기존 회원 정보 얻기
	    if (!member.getM_pw().equals(oldPassword)) {
	        rAttr.addFlashAttribute("errorMessage", "기존 비밀번호가 일치하지 않습니다.");
	        return "redirect:/member/modify";
	    }

	    MemberImageVO mivo = null;
	    if(file != null && file.getSize() > 0) { 
	        mivo = mihd.uploadFile(file); 
	    } else {
	        log.info("modify file null");
	    }

	    member.setM_pw(newPassword);
	    member.setM_nick_name(nickname);
	    member.setM_introduct(introduce);

	    MemberDTO mdto = new MemberDTO(member, mivo);
	    int isOk = memberService.modifyMember(mdto);

	    if(isOk > 0) {
	        m.addAttribute("msg_modify", 1);
	        rAttr.addFlashAttribute("isOk", isOk);
	    } else {
	        m.addAttribute("msg_modify", 0);
	    }

	    return "redirect:/member/detail";
	}




	
	
	
	


	
	/*	@PostMapping("/signup")
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
	
*/	
	
	/*	//프로필 사진 업로드
	 @PostMapping("/signup")
	    public String profilePost(MemberVO mvo ,RedirectAttributes rAttr,
	            @RequestParam(name="file", required = false)MultipartFile file) {
	        log.info(">>> mvo "+mvo);
	        log.info(">>> file "+file);

	        MemberImageVO mivo = null;
	        if(file.getSize() > 0) { 
	        	mivo = mihd.uploadFile(file); 
	        } else {
	            log.info("file null");
	        }
	    
	        MemberDTO mdto = new MemberDTO(mvo, mivo);
	        int isOk = memberService.register(mdto);
	        
	        log.info("-=-=> board register >>"+ (isOk >0 ? "OK" : "FAIL"));
	        rAttr.addFlashAttribute("isOk", isOk);
	        return "redirect:/member/signup";
	    }

*/	

}
