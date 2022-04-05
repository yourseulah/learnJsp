package com.it.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.it.domain.CartmainVO;
import com.it.domain.OrderListDTO;
import com.it.domain.OrderdetailDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermemberDTO;

public interface OrderService {
	
	public List<OrderListDTO> getOrderList(@Param("pageNum") int pageNum, @Param("pageAmount") int pageAmount, @Param("m_id") String m_id);
	//public List<OrderListDTO> getOrderList(OrderListDTO orderlist);
	
	public int getTotalCount();
	
	public OrdermainVO orderproc(CartmainVO cartmain);
	
	public List<OrderdetailDTO> getListOrderDetail(OrdermainVO ordermain);
	//주문상세내용을 처리할 메서드선언 ordermain가방에 om_code넣어서 호출할것임
	
	public OrdermemberDTO getOrderTotal(OrdermainVO ordermain);
}
