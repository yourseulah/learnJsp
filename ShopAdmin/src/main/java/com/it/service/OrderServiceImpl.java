package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.OrderListDTO;
import com.it.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j	
@Service 
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper ordermapper;
		
	@Override 
	public List<OrderListDTO> getOrderList(OrderListDTO orderlist) { 
		return ordermapper.getOrderList(orderlist); 
	}
		
				
}
