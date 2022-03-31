package com.it.mapper;

import java.util.List;

import com.it.domain.OrderListDTO;

public interface OrderMapper {
	
	public List<OrderListDTO> getOrderList(OrderListDTO orderlist);

}
