package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.CartmainVO;
import com.it.domain.CartsubVO;
import com.it.service.CartService;
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
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberservice;
	
	@Setter(onMethod_ = @Autowired)
	private CartService cartservice;
	
	@GetMapping("/list")
	public void list(Model model) { //Model 객체는 VO객체를(테이블 데이터를) 저장해서 list.jsp파일로 데이터 전달
		model.addAttribute("list", productservice.getList()); 
		//getList로 조회한 모든 내용을 list 변수로 전달
	}
	
	@PostMapping("/cart")
	public String cart(HttpSession session, CartsubVO cartsub) {
		//아무때나 session은 매개변수로 추가할수 있다
		log.info("-----장바구니테스트-----");
		log.info(cartsub);
		
		//submit누르고 로그인 안되어 있으면 그다음 프로세스가 안되도록 제어하기
		String m_id = (String)session.getAttribute("m_id");
		if(m_id != null) { //로그인 되어 있을 경우 장바구니 처리 진행
			CartmainVO cartmain = new CartmainVO();
			cartmain.setM_id(m_id); // VO에 사용자의 세션정보를 저장 
			cartservice.cartinsert(cartmain, cartsub); //서비스계층 호출
				//cartmain : 사용자정보가 담겨있고 m_id만 담김
				//cartsub : 상품정보가 담겨있고
			//log.info("로그인오케이");
			
			return "redirect: /shop/cartinfo";
		} else {
			//log.info("로그인안됨");
			return "redirect: /member/login";
		}
	}
	
	@GetMapping ("/cartinfo")
	public void cartinfo (HttpSession session, Model model) {
		//장바구니버튼 눌러서 넘어올수도 있고 위에 장바구니로 넘어올수도 있고 - 고려해서 만들기 
		//해당사용자의 장바구니리스트 tblcartsub에서는 m_id없으니까 cm_code로 
		
		//1. 세션아이디를 이용해서 cm_code를 조회해야함
		//2. cm_code를 이용해서 getListCart 를 조회해서 리스트 출력
		String m_id = (String)session.getAttribute("m_id");
		CartmainVO cartmain = new CartmainVO();
		cartmain.setM_id(m_id);
		cartmain = cartservice.readcmcode(cartmain);
		CartsubVO cartsub = new CartsubVO();
		log.info(cartmain);
	
		cartsub.setCm_code(cartmain.getCm_code());
		log.info(cartsub);
		
		model.addAttribute("list", cartservice.getListCart(cartsub));
		//List<CartsubVO> cartlist = cartservice.getListCart(cartsub);
		//cartlist.forEach(cart -> log.info(cart));
	}
	
	
}
