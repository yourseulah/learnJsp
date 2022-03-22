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
		//admin 바구니 안에 id와 passwd만 들어옴
		boolean chk = service.auth(admin);
		if(chk == true) {	
			//세션변수 생성하면서 저장하는 setAttribute 메서드
			//setAttribute (저장할변수이름, 변수값) 
			session.setAttribute("a_id", admin.getA_id()); //세션변수 생성
			
			//notice에서 작성자는 관리자밖에 없으니 이름을 default값으로 주기위해서 read 메서드로 레코드전체를 뽑아오도록함
			admin = service.read(admin);
			log.info(admin); 
			session.setAttribute("a_name", admin.getA_name());
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
