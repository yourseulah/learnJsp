package com.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.ProductVO;
import com.it.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/")
public class ProductController {

	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@GetMapping("/list")
	public void list(Model model) { 
	//Model 객체는 VO객체를(테이블 데이터를) 저장해서 
	//list.jsp파일로 데이터 전송
		model.addAttribute("list", service.getList()); 
		//getList로 조회한 모든 내용을 list 변수로 전달
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	@PostMapping("/insert")
	public String insert(ProductVO product) {
		//log.info(product);
		service.insert(product);
		return "redirect:/product/list";
	}
	
	@GetMapping("/view")
	public void view(ProductVO product, Model model) {
		log.info("-----읽기전-----");
		log.info(product);
		product = service.read(product);
		
		log.info("-----읽은후-----");
		log.info(product);
		model.addAttribute("product", product);
	}
}
