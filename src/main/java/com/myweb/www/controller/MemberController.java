package com.myweb.www.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.MemberDTO;
import com.myweb.www.domain.MemberImageVO;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.handler.MemberImageHandler;
import com.myweb.www.service.MemberService;
import com.myweb.www.service.ProductService;

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
	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	@Inject
	private ProductService psv;

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
	
	//이메일 중복체크
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("m_mail") String m_mail) {
	    log.info("Checking email: " + m_mail);
	    return memberService.emailCheck(m_mail);
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
	    	//탈퇴한 회원 확인
	    	if(isMember.getM_isDel() == 1) {
	            redirectAttributes.addFlashAttribute("errorMessage", "탈퇴한 회원입니다.");
	            return "redirect:/member/signin";
	        }
	    	//정상적인 회원
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
		
		return "redirect:/";
	}
	
	// 회원정보
	@GetMapping("/detail")
	public String getMemberDetails(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    Integer m_number = (Integer) session.getAttribute("m_number");
	    
	    MemberDTO member = memberService.getMemberDetails(m_number);
	    
	    // 상품 정보를 가져옵니다.
	    List<ProductDTO> productList = psv.getProductByMember(m_number);
	    
	    // 찜한 상품 정보를 가져옵니다.
	    List<ProductDTO> likedProductList = psv.getLikedProductsByMember(m_number);
	    
	    model.addAttribute("member", member);
	    //내가 작성한 상품 리스트
	    model.addAttribute("productList", productList);
	    //내가 찜한 게시글
	    model.addAttribute("likedProductList", likedProductList);
	    
	    if (member != null) {
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
		                         @RequestParam("m_pw") String oldPassword,
		                         @RequestParam("m_chgPw") String newPassword,
		                         @RequestParam("m_nick_name") String nickname,
		                         @RequestParam("m_introduct") String introduce,
		                         @RequestParam(name="file", required = false) MultipartFile file,
		                         @RequestParam("m_address") String address,
		                         Model model) {
			log.info("회원 정보 수정 시작: " + request.getSession().getAttribute("m_number"));
		    // 현재 로그인한 사용자 정보를 받아옴.
		    HttpSession session = request.getSession();
		    MemberVO loggedInUser = (MemberVO)session.getAttribute("ses");

		    if (loggedInUser == null) {
		        // 로그인이 되어있지 않으면 로그인 페이지로 리다이렉트
		        return "redirect:/member/signin";
		    }

		    // 비밀번호 확인. 만약 기존 비밀번호와 일치하지 않으면 오류 메시지를 띄우고 수정 페이지로 돌아감.
		    if (!passwordEncoder.matches(oldPassword, loggedInUser.getM_pw())) {
		    	log.info("비밀번호 일치하지 않음: " + loggedInUser.getM_number());
		        model.addAttribute("errorMessage", "기존 비밀번호가 일치하지 않습니다.");
		        return "member/modify";
		    }

		    // 새로운 비밀번호 암호화
		    String encodedNewPassword = passwordEncoder.encode(newPassword);
		    loggedInUser.setM_pw(encodedNewPassword);
		    log.info("비밀번호 암호화 완료: " + loggedInUser.getM_number());
		    
		 // 세션에 변경된 사용자 정보 업데이트
		    session.setAttribute("ses", loggedInUser);
		    log.info("세션 정보 업데이트 완료: " + loggedInUser.getM_number());

		    // 닉네임, 자기소개, 주소 변경
		    loggedInUser.setM_nick_name(nickname);
		    loggedInUser.setM_introduct(introduce);
		    loggedInUser.setM_address(address);
		    log.info("회원 정보 변경 완료: " + loggedInUser.getM_number());

		 // 파일이 업로드 된 경우에만 파일 변경
		    if (file != null && !file.isEmpty()) {
		    	MemberImageVO memberImage = mihd.uploadFile(file);
		        memberImage.setM_number(loggedInUser.getM_number());

		        // 회원 정보와 이미지 정보를 가지는 MemberDTO 객체를 생성합니다.
		        MemberDTO memberDTO = new MemberDTO();
		        memberDTO.setMvo(loggedInUser);
		        memberDTO.setMivo(memberImage);

		        // 회원 정보와 이미지 정보를 DB에 업데이트합니다.
		        try {
		            memberService.updateMember(memberDTO);
		            log.info("회원 정보 DB 업데이트 완료: " + loggedInUser.getM_number());

		            // DB 업데이트 후 세션 업데이트
		            session.setAttribute("ses", loggedInUser);
		            log.info("세션 정보 업데이트 완료: " + loggedInUser.getM_number());

		            // 사용자 정보 변경 확인
		            log.info("변경된 회원 정보: " + loggedInUser);
		        } catch (Exception e) {
		            log.error("회원 정보 DB 업데이트 오류: " + loggedInUser.getM_number(), e);
		        }
		        
		    } else {
		        // 파일이 업로드되지 않은 경우, 이미지 정보 없이 사용자 정보만 변경합니다.
		        MemberDTO memberDTO = new MemberDTO();
		        memberDTO.setMvo(loggedInUser);
		        memberService.updateMember(memberDTO);
		        log.info("회원 정보 DB 업데이트 완료 (이미지 없음): " + loggedInUser.getM_number()); // 회원 정보 업데이트 완료 로그 (이미지 없음)
		        
		     // DB 업데이트 후 세션 업데이트
		        session.setAttribute("ses", loggedInUser);
		        log.info("세션 정보 업데이트 완료: " + loggedInUser.getM_number());

		        // 사용자 정보 변경 확인
		        log.info("변경된 회원 정보: " + loggedInUser);
		    }



		    
		    log.info("회원 정보 수정 완료: " + request.getSession().getAttribute("m_number"));
		    // 수정이 완료되었으면 메인 페이지로 리다이렉트
		    return "redirect:/";
		}
		
		@PostMapping("/checkPassword")
		@ResponseBody
		public ResponseEntity<Boolean> checkPassword(HttpServletRequest request, @RequestParam("m_pw") String oldPassword){
		    // 세션에서 사용자 검색
		    HttpSession session = request.getSession();
		    System.out.println("Session: " + session);
		    MemberVO loggedInUser = (MemberVO)session.getAttribute("ses");
		    System.out.println("Logged in user: " + loggedInUser);
		    
		    System.out.println("Received old password: " + oldPassword); // Added logging here
		    System.out.println("Password in session: " + loggedInUser.getM_pw()); // Added logging here

		    if(loggedInUser != null) {
		        System.out.println("Password from session: " + loggedInUser.getM_pw());
		    }
		    
		    // 해시된 암호가 입력한 암호와 일치하는지 확인
		    boolean isPasswordMatching = passwordEncoder.matches(oldPassword, loggedInUser.getM_pw());
		    System.out.println("Is password matching: " + isPasswordMatching); // Added logging here

		    return ResponseEntity.ok().body(isPasswordMatching);
		}
	
	
	//회원탈퇴 기능(실제 DB에서 삭제X / isDel 값만 1로 변경 / 추후 관리를 위해 Map으로)
	@PostMapping("/remove")
	@ResponseBody
	public ResponseEntity<String> removeMember(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    MemberVO loggedInUser = (MemberVO)session.getAttribute("ses");
	    
	    if(loggedInUser == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요한 서비스입니다.");
	    }

	    int m_number = loggedInUser.getM_number();
	    Map<String, Object> params = new HashMap<>();
	    params.put("m_number", m_number);
	    params.put("isDel", 1);
	    int isDel = memberService.updateMemberStatus(params);
	    
	    //서버 오류 확인을 위해 추가
	    if(isDel > 0) {
	        session.invalidate(); // 세션 종료
	        return ResponseEntity.ok().body("회원탈퇴가 정상적으로 처리되었습니다.");
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("회원탈퇴에 실패하였습니다. 다시 시도해주세요.");
	    }
	}



	


}
