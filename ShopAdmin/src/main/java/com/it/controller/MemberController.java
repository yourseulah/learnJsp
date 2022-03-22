package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.MemberVO;
import com.it.domain.PageDTO;
import com.it.domain.PageViewDTO;
import com.it.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@GetMapping("/list")
	public String list(HttpSession session, Model model, PageDTO page) { 
		String a_id = (String)session.getAttribute("a_id");
			if(a_id != null) {
				int total = service.getTotalCount();
				
				PageViewDTO pageview = new PageViewDTO(page, total);
				model.addAttribute("pageview", pageview);
				model.addAttribute("page", page);
				model.addAttribute("list", service.getList(page)); 
				
				return "/member/list";
			} else {
				return "redirect:/admin/login";
			}
	}
	
	@GetMapping("/insert")
	public String insert (HttpSession session) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		} else {
			return "/member/insert";
		}
	}
	
	@PostMapping("/insert")
	public String insert(MemberVO member) {
		log.info("----글쓰기시작-----");
		log.info(member);
		service.insert(member); 
		
		log.info("----글쓰기완료-----");
		return "redirect:/member/login"; 
	}
	
	@GetMapping("/view")
	public String view(HttpSession session, MemberVO member, Model model) { 
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		} else {
			log.info("------읽기전------");
			log.info(member);
			member = service.read(member); 
		
			log.info("------읽은후------");
			log.info(member);
			
			model.addAttribute("member", member);
			return "/member/view";
		}
	}
	
	@GetMapping("/update")
	public String update(HttpSession session, MemberVO member, Model model) { 
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		} else {
			//update.jsp로 넘겨주는 model객체 선언
			log.info("-----업데이트를 위한 번호------");
			log.info(member);
			member = service.read(member); //번호만 사용하여 조회
			log.info("-----업데이트를 위한 데이터-----");
			log.info(member);
			model.addAttribute("member", member);	
			return "/member/update";
		}
		
	}
	
	@PostMapping("/update")
	public String update(MemberVO member) {
		log.info("-----업데이트데이터-----");
		log.info(member);
		service.update(member); //업데이트
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
		log.info(member);
		//service 쪽 log가 찍히지 않아서 여기서 다시 해주기
		
		boolean chk = service.auth(member);
		if(chk == true) {	
			member = service.read(member); //auth로는 못가져와서 read로 id와 passwd 가져오기
			//세션변수 생성하면서 저장하는 setAttribute 메서드
			//setAttribute (저장할변수이름, 변수값)
			session.setAttribute("m_id", member.getM_id()); //세션변수 생성
			session.setAttribute("m_name", member.getM_name()); //세션변수 생성
			log.info("로그인성공");
			return "redirect: /shop/list";
			
		} else {
			log.info("로그인실패");
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//세션처리용으로 session 
		session.invalidate(); //세션 끊기, 관련된 모든 변수 삭제 
		//로그아웃한 뒤에 home으로 가라
		return "redirect:/";
	}
	
}
