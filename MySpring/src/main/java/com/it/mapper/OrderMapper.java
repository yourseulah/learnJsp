package com.it.mapper;

import com.it.domain.OrdermainVO;
import com.it.domain.OrdersubVO;

public interface OrderMapper {
	//주문영수증
	public void insertmain(OrdermainVO ordermain);
	
	public OrdermainVO readmainid(OrdermainVO ordermain);
	
	public void insertsub(OrdersubVO ordersub);
	

	
}
