package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.MemberVO;
import com.it.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/list")
	public void list(Model model) { 
		model.addAttribute("list", service.getList()); 
	}
	
	@GetMapping("/regist")
	public void regist () {
		//메세지를 호출만 함
	}
	
	@PostMapping("/regist")
	public String regist(MemberVO member) {
		service.regist(member); 
		log.info(member);
		return "redirect:/member/login"; 
	}
	
	@GetMapping("/view")
	public void view(MemberVO member, Model model) { 
		log.info("------읽기전------");
		log.info(member);
		member = service.read(member); 
	
		log.info("------읽은후------");
		log.info(member);
		
		model.addAttribute("member", member);
	}
	
	@GetMapping("/update")
	public void update(MemberVO member, Model model) { 
		//update.jsp로 넘겨주는 model객체 선언
		log.info("-----업데이트를 위한 번호------");
		log.info(member);
		member = service.read(member); //번호만 사용하여 조회
		log.info("-----업데이트를 위한 데이터-----");
		log.info(member);
		model.addAttribute("member", member);
	}
	
	@PostMapping("/update")
	public String update(MemberVO member) {
		log.info("-----업데이트데이터-----");
		log.info(member);
		service.update(member); 
		return "redirect:/member/view?m_id=" + member.getM_id();
		//get으로 넘길때 id값이 영문이어야만 한다. 한글 못읽음
	}

	@GetMapping("/delete")
	public String delete(MemberVO member) {
		log.info("-------삭제--------");
		service.delete(member);
		return "redirect:/member/list";
	}
	
	@GetMapping("/login")
	public void  login() {
		//로그인 페이지 호출
	}
	
	@PostMapping("/login")
	public String login(MemberVO member, HttpSession session) {
		//log.info(member);
		
		MemberVO storedId = service.read(member);
		//log.info(storedId);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//log.info(storedId.getM_passwd());
		
		// matches(입력된 값, 데이터에 저장된값)
		// 입력된 값을 인코딩 후 인코딩되어져 저장된 값과 비교하여 맞으면 로그인 성공
		if(encoder.matches(member.getM_passwd(), storedId.getM_passwd())) {
			session.setAttribute("m_id", storedId.getM_id()); //세션변수 생성
			session.setAttribute("m_name", storedId.getM_name()); //세션변수 생성
			log.info("member: "+ member);
			log.info("로그인성공");
			log.info(session.getAttribute("m_name"));
			return "redirect: /shop/list";
			
		} else {
			log.info("로그인실패");
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 끊기, 관련된 모든 변수 삭제 
		//로그아웃한 뒤에 home으로 가라
		return "redirect:/";
	}
	
	
}
