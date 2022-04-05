package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.OrderListDTO;
import com.it.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/")
public class shopController {

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
	
	// redirect 사용 : 처리할 내용이 Controller에 있을때. 컨트롤러의 메서드를 호출후에 jsp로 이동,
	// redirect 사용X : 처리할 내용이 Controller에 없을때. jsp 페이지로 바로 이동한다
	
}
