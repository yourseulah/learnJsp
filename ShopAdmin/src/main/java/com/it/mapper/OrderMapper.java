package com.it.mapper;

import java.util.List;

import com.it.domain.OrderListDTO;
import com.it.domain.OrderdetailDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermemberDTO;
import com.it.domain.OrdersubVO;

public interface OrderMapper {
	
	public List<OrderListDTO> getOrderList(OrderListDTO orderlist);
	//public List<OrderListDTO> getOrderList(OrderListDTO orderlist, PageDTO page);
	
	//public int getTotalCount();
	
	//여기서부터는 관리자페이지에서 필요없음
	//주문영수증
	public void insertmain(OrdermainVO ordermain);
	
	public OrdermainVO readmainid(OrdermainVO ordermain);
	
	public void insertsub(OrdersubVO ordersub);
	
	public List<OrderdetailDTO> getListOrderDetail(OrdermainVO ordermain);
	
	public OrdermemberDTO getOrderTotal(OrdermainVO ordermain);
}
