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
	public void list(HttpSession session, Model model, PageDTO page) { 
		String a_id = (String)session.getAttribute("a_id");
			if(a_id != null) {
				model.addAttribute("list", service.getList()); 
				
			}
	}
	
	@GetMapping("/insert")
	public void insert () {
		//메세지를 호출만 함
	}
	
	@PostMapping("/insert")
	public String insert(MemberVO member) {
		log.info("--------글쓰기시작--------");
		log.info(member);
		//insert.jsp form을 통해 넘어온걸 
		//서비스 계층에 넘겨준다 테이블에 입력
		service.insert(member); 
		
		//리스트로 이동 (return 사용)
		log.info("--------글쓰기완료--------");
		return "redirect:/member/list"; 
		//반환하는 값이 ""안에 있으니까 type이 String
		//controller 를 통해서 이동 
	}
	
	@GetMapping("/view")
	//list.jsp로부터 get방식으로 넘겨온 번호를 하나 받는데 
	//이렇게 큰 가방이 필요할까 싶지만 그래도 가장 안전한 방법
	//내용전체가 아니라 글번호 딱 하나만 받는 view메서드 안에 board객체 (임시저장용) 
	//view.jsp로 넘겨주는 model객체 선언
	public void view(MemberVO member, Model model) { 
		log.info("------읽기전------");
		log.info(member);
		//board로 데이터 들어온것 확인 (mapper까지 내려감)
		//글번호 하나만 받은 board를 service의 read함수로 모든 데이터를 다시 board객체에 대입
		member = service.read(member); 
	
		log.info("------읽은후------");
		log.info(member);
		
		//글번호에 해당하는 모든 정보를 담은 board를 변수"board"로 view.jsp에 넘겨준다.
		//왼쪽board : jsp에서 사용할명칭 (따라서 다른이름도 상관없는데 의미부여를위해)
		//오른쪽board : 위에서 데이터받은 객체
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
