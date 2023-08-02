package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardLocationDTO;
import com.myweb.www.domain.BoardLocationImageVO;
import com.myweb.www.domain.BoardLocationPagingVO;
import com.myweb.www.domain.BoardLocationVO;
import com.myweb.www.handler.BoardLocationImageHandler;
import com.myweb.www.handler.BoardLocationPagingHandler;
import com.myweb.www.service.BoardLocationService;

@Controller
@RequestMapping("/board_location/*")
public class BoardLocationController {
	@Inject
	private BoardLocationService blsv;
	@Inject
	private BoardLocationImageHandler blih;

	@GetMapping("list")
	public void list(BoardLocationPagingVO blpvo, Model m) {
		m.addAttribute("blpvo", blpvo);
		List<BoardLocationDTO> bldto = blsv.locationList(blpvo);
		m.addAttribute("bldto", bldto);
		int totalCount = blsv.getTotalCount(blpvo);
		BoardLocationPagingHandler blph = new BoardLocationPagingHandler(blpvo, totalCount);
		m.addAttribute("blph", blph);
	}
		
	@GetMapping("register")
	public void register() {}
	
	public String postRegister(RedirectAttributes rAttr, BoardLocationVO blvo, @RequestParam(name="files")MultipartFile[] files) {
		List<BoardLocationImageVO> blivo = null;
		if(files[0].getSize()>0) {
			blivo = blih.uploadLocationFiles(files);
		}
		BoardLocationDTO bldto = new BoardLocationDTO(blvo, blivo, null);
		int isOk = blsv.boardLocationRegister(bldto);
		rAttr.addFlashAttribute("isOk",isOk);
		return "redirect:/board_location/list";
	}
	
	@GetMapping("detail")
	public void detail() {}
	
	@GetMapping("modify")
	public void modify() {}
}