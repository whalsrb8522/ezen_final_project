package com.myweb.www.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Autowired
	private PasswordEncoder passwordEncoder;

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
	
//	@GetMapping("/modify")	
//	public void modify() {	
//
//	}

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
	                         @RequestParam("m_pw") String oldPassword,
	                         @RequestParam("m_chgPw") String newPassword,
	                         @RequestParam("m_nick_name") String nickname,
	                         @RequestParam("m_introduct") String introduce,
	                         @RequestParam(name="file", required = false) MultipartFile file,
	                         @RequestParam("m_address") String address,
	                         Model model) {
	    // 현재 로그인한 사용자 정보를 받아옴.
	    HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

	    if (loginUser == null) {
	        // 로그인이 되어있지 않으면 로그인 페이지로 리다이렉트
	        return "redirect:/login";
	    }

	    // 비밀번호 확인. 만약 기존 비밀번호와 일치하지 않으면 오류 메시지를 띄우고 수정 페이지로 돌아감.
	    if (!passwordEncoder.matches(oldPassword, loginUser.getM_pw())) {
	        model.addAttribute("errorMessage", "기존 비밀번호가 일치하지 않습니다.");
	        return "member/modify";
	    }

	    // 새로운 비밀번호 암호화
	    String encodedNewPassword = passwordEncoder.encode(newPassword);
	    loginUser.setM_pw(encodedNewPassword);

	    // 닉네임, 자기소개, 주소 변경
	    loginUser.setM_nick_name(nickname);
	    loginUser.setM_introduct(introduce);
	    loginUser.setM_address(address);

	    // 파일이 업로드 된 경우에만 파일 변경
	    if (file != null && !file.isEmpty()) {
	        String originalFilename = file.getOriginalFilename();
	        String filename = System.currentTimeMillis() + originalFilename;
	        String savePath = "E:\\\\Workspace\\\\ezen_final_project\\\\src\\\\main\\\\webapp\\\\resources\\\\fileUpload";  // 저장 경로, 실제 프로젝트에 맞게 수정 필요

	        try {
	            file.transferTo(new File(savePath, filename));
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        loginUser.setProfileImage(filename);  // 'setProfileImage'를 'MemberVO' 클래스가 가지고 있다고 가정
	    }

	    // 사용자 정보 변경 적용
	    memberService.updateMember(loginUser);  // 'updateMember'를 'MemberService' 인터페이스가 제공한다고 가정

	    // 세션에 변경된 사용자 정보 업데이트
	    session.setAttribute("loginUser", loginUser);

	    // 수정이 완료되었으면 메인 페이지로 리다이렉트
	    return "redirect:/";
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
