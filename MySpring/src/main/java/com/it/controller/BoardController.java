package com.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.BoardVO;
import com.it.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/")
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model) { 
	//Model 객체는 VO객체를(테이블 데이터를) 저장해서 jsp파일로 전송
	//list.jsp에 데이터를 전달해야함 
		model.addAttribute("list", service.getList()); 
		//getList로 조회한 모든 내용을 list 변수로 전달
	}
	
	@GetMapping("/insert")
	public void insert () {
		//메세지를 호출만 함
	}
	
	@PostMapping("/insert")
	public void insert(BoardVO board) {
		log.info(board);
		//테이블에 입력
		//리스트로 이동
	}
	
	
}
 