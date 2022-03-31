package com.it.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.it.domain.OrderListDTO;
import com.it.domain.OrderdetailDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermemberDTO;
import com.it.domain.OrdersubVO;

public interface OrderMapper {
	
	public List<OrderListDTO> getOrderList(@Param("pageNum") int pageNum, @Param("pageAmount") int pageAmount, @Param("m_id") String m_id);
	
	public int getTotalCount();
	
	public void insertmain(OrdermainVO ordermain);
	
	public OrdermainVO readmainid(OrdermainVO ordermain);
	
	public void insertsub(OrdersubVO ordersub);
	
	public List<OrderdetailDTO> getListOrderDetail(OrdermainVO ordermain);
	
	public OrdermemberDTO getOrderTotal(OrdermainVO ordermain);
}
