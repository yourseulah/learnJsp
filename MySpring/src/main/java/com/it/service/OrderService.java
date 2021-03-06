package com.it.service;

import java.util.List;

import com.it.domain.CartmainVO;
import com.it.domain.OrderdetailDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermemberDTO;

public interface OrderService {
	
	public OrdermainVO orderproc(CartmainVO cartmain);
	
	public List<OrderdetailDTO> getListOrderDetail(OrdermainVO ordermain);
	//주문상세내용을 처리할 메서드선언 ordermain가방에 om_code넣어서 호출할것임
	
	public OrdermemberDTO getOrderTotal(OrdermainVO ordermain);
}
