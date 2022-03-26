package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;
import com.it.domain.OrderListDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermemberDTO;
import com.it.domain.PageDTO;
import com.it.service.CartService;
import com.it.service.MemberService;
import com.it.service.OrderService;
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

	@Setter(onMethod_ = @Autowired)
	private OrderService orderservice;

	//모든사용자의 주문리스트 내역 뿌려주기
	@GetMapping("/orderlist")
	public String orderlist(HttpSession session, OrderListDTO orderlist, Model model) {
		String a_id = (String) session.getAttribute("a_id");
		if (a_id != null) {
			model.addAttribute("list", orderservice.getOrderList(orderlist));
			return "/shop/orderlist";
		} else {
			return "redirect: /admin/login";
		}
	}
	
	 //int total = orderservice.getTotalCount(); PageViewDTO pageview = new
	 //PageViewDTO(page, total); model.addAttribute("pageview", pageview);
	 //model.addAttribute("page", page);
	 
	//여기서부터는 관리자페이지에서는 필요X
	
	 @GetMapping("/list") 
	 public void list(HttpSession session, Model model, PageDTO page) { //Model 객체는 VO객체를(테이블 데이터를) 저장해서 list.jsp파일로 데이터 전달
	 model.addAttribute("list", productservice.getList(page)); //getList로 조회한 모든
	 //내용을 list 변수로 전달
	  
	 //로그인상태확인 
	 String a_id = (String)session.getAttribute("a_id"); 
	 String a_name = (String)session.getAttribute("a_name"); 
	 model.addAttribute("a_id", a_id);
	 //여기한곳에서만해주면 다 적용된다. 
	 }

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션끊기
		return "redirect:/shop/list";
	}

	@PostMapping("/cart")
	public String cart(HttpSession session, CartsubVO cartsub) {
		// 아무때나 session은 매개변수로 추가할수 있다
		log.info("-----장바구니테스트-----");
		log.info(cartsub);

		// submit누르고 로그인 안되어 있으면 그다음 프로세스가 안되도록 제어하기
		String m_id = (String) session.getAttribute("m_id");
		if (m_id != null) { // 로그인 되어 있을 경우 장바구니 처리 진행
			CartmainVO cartmain = new CartmainVO();
			cartmain.setM_id(m_id); // VO에 사용자의 세션정보를 저장
			cartservice.cartinsert(cartmain, cartsub); // 서비스계층 호출
			// cartmain : 사용자정보가 담겨있고 m_id만 담김
			// cartsub : 상품정보가 담겨있고
			// log.info("로그인오케이");
			return "redirect: /shop/cartinfo";
		} else {
			// log.info("로그인안됨");
			return "redirect: /member/login";
		}
	}

	@GetMapping("/cartinfo")
	public String cartinfo(HttpSession session, Model model) {
		// 장바구니버튼 눌러서 넘어올수도 있고 위에 장바구니로 넘어올수도 있고 - 고려해서 만들기
		// 해당사용자의 장바구니리스트 tblcartsub에서는 m_id없으니까 cm_code로

		// 로그인상태확인
		String m_id = (String) session.getAttribute("m_id");
		String m_name = (String) session.getAttribute("m_name");
		if (m_id != null) { // 로그인이 되어 있다면

			// 1. 세션아이디(m_id)를 이용해서 cm_code를 조회해야함
			CartmainVO cartmain = new CartmainVO();
			cartmain.setM_id(m_id);
			cartmain = cartservice.readcmcode(cartmain);
			log.info(cartmain);

			if (cartmain != null) { // 장바구니에 담은 상품이 있다면 - 같은상품이아니더라도 뭐 하나라도 있으면
				// cartservice.getListCart(cartmain).forEach(cartsub -> log.info(cartsub));
				model.addAttribute("list", cartservice.getListCartDetail(cartmain));

				CartmemberDTO carttotal = cartservice.getCartTotal(cartmain); // cm_total만 있으니까
				carttotal.setCm_code(cartmain.getCm_code()); // cm_code 넣기
				carttotal.setM_id(m_id); // m_id 넣기
				carttotal.setM_name(m_name); // m_name 넣기
				model.addAttribute("carttotal", carttotal);
				// mapper레벨까지 가서 getListCartDetail쿼리를 고치지 않고 cm_code를 이미담은 변수 넘기기(장바구니 세부항목 삭제시
				// 필요)
				// model.addAttribute("cartmain", cartmain); //cm_code을 담은 cartmain 가방을 넘기자
				model.addAttribute("cm_code", cartmain.getCm_code()); // cm_code 단일변수명으로 넘기기

				log.info("장바구니에 담은 상품이 있습니다");
			} else { // 장바구니에 담은 상품이 없다면
				log.info("장바구니에 담은 상품이 없습니다 ");
			}
			log.info("로그인상태");
			return "/shop/cartinfo"; // cartinfo 페이지로 이동 (반드시 작성)
			// 이미할일다하고 보내는거라 redirect를 쓰지 않는다

		} else {
			log.info("로그아웃상태");
			return "/member/login"; // 컨트롤러의 메서드를 호출후에 jsp로 이동, redirect생략시 jsp 페이지로 바로 이동한다
		}
	}

	@PostMapping("/cartupdate")
	public String cartupdate(CartsubVO cartsub) {
		// cs_code넘어옴
		cartservice.updatesub(cartsub);
		return "redirect:/shop/cartinfo";
	}

	@GetMapping("/cartdelete")
	public String cartdelete(CartsubVO carsub) { // cs_code & cm_code 같이 넘어감
		cartservice.deletesub(carsub);
		return "redirect: /shop/cartinfo";
	}

	@GetMapping("/cartdeleteall")
	public String cartdeletall(CartmainVO cartmain) {
		cartservice.deletesuball(cartmain);
		return "redirect: /shop/cartinfo";
	}

	@GetMapping("/orderinfo")
	public String orderinfo(HttpSession session, CartmainVO cartmain, Model model) {
		// 로그인상태확인
		String m_id = (String) session.getAttribute("m_id");
		String m_name = (String) session.getAttribute("m_name");
		if (m_id != null) { // 로그인이 되어 있다면
			cartmain.setM_id(m_id);
			OrdermainVO ordermain = orderservice.orderproc(cartmain); // om_code획득
			model.addAttribute("list", orderservice.getListOrderDetail(ordermain));

			OrdermemberDTO ordertotal = orderservice.getOrderTotal(ordermain); // om_total만 있으니까
			ordertotal.setOm_code(ordermain.getOm_code()); // om_code 넣기
			ordertotal.setM_id(m_id); // m_id 넣기
			ordertotal.setM_name(m_name); // m_name 넣기
			model.addAttribute("ordertotal", ordertotal);

			return "/shop/orderinfo";
		} else {
			return "/member/login";
			// redirect 사용할경우 : 처리할 내용이 Controller에 있을때. 컨트롤러의 메서드를 호출후에 jsp로 이동,
			// redirect 사용하지않을경우 : 처리할 내용이 Controller에 없을때. jsp 페이지로 바로 이동한다
		}
	}



}
