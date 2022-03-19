package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.AdminVO;
import com.it.service.AdminService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/")
public class AdminController {
	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@GetMapping("/login")
	public void  login() {
		//로그인 페이지 호출
	}

	@PostMapping("/login")
	public String login(AdminVO admin, HttpSession session) {
		log.info(admin);
		//service 쪽 log가 찍히지 않아서 여기서 다시 해주기
		
		boolean chk = service.auth(admin);
		if(chk == true) {	
			//세션변수 생성하면서 저장하는 setAttribute 메서드
			//setAttribute (저장할변수이름, 변수값)
			session.setAttribute("a_id", admin.getA_id()); //세션변수 생성
			log.info("로그인성공");
			return "redirect:/product/list";
			
		} else {
			log.info("로그인실패");
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//세션처리용으로 session 
		session.invalidate(); //세션 끊기, 관련된 모든 변수 삭제 
		//로그아웃한 뒤에 home으로 가라
		return "redirect:/admin/login";
	}
}
