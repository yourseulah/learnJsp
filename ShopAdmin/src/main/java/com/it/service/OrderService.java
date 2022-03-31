package com.it.service;

import java.util.List;

import com.it.domain.OrderListDTO;

public interface OrderService {
	
	public List<OrderListDTO> getOrderList(OrderListDTO orderlist);

}
