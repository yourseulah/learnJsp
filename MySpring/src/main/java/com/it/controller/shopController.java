package com.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.service.MemberService;
import com.it.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/")
public class shopController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService productservice;
	
	@Setter(onMethod_ =@Autowired)
	private MemberService memberservice;
	
	@GetMapping("/list")
	public void list(Model model) { //Model 객체는 VO객체를(테이블 데이터를) 저장해서 list.jsp파일로 데이터 전달
		model.addAttribute("list", productservice.getList()); 
		//getList로 조회한 모든 내용을 list 변수로 전달
	}
	
	
	
	
}
