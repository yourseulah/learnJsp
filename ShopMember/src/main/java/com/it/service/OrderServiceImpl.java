package com.it.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.CartmainVO;
import com.it.domain.CartsubVO;
import com.it.domain.OrderListDTO;
import com.it.domain.OrderdetailDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermemberDTO;
import com.it.domain.OrdersubVO;
import com.it.mapper.CartMapper;
import com.it.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j	
@Service 
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper ordermapper;
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartmapper;
	
	@Override
	public List<OrderListDTO> getOrderList(@Param("pageNum") int pageNum, @Param("pageAmount") int pageAmount, @Param("m_id") String m_id) {
		return ordermapper.getOrderList(pageNum, pageAmount, m_id);
	}
	
	@Override
	public int getTotalCount() {
		return ordermapper.getTotalCount();
	}
	
	@Override
	public OrdermainVO orderproc(CartmainVO cartmain) { //om_code 반환(주문리스트에서 사용)
		//주문main insert (신규생성)
		//cm_code를 사용하여 장바구니 sub조회
		//om_code 조회
		//주문sub에 insert 
		//장바구니sub 삭제 (cm_code 활용)
		//장바구니main 삭제 (cm_code 활용)
		//om_code를 반환
		
		OrdermainVO ordermain = new OrdermainVO();
		ordermain.setM_id(cartmain.getM_id());
		System.out.println(ordermain.getM_id());
		
		ordermapper.insertmain(ordermain);
		ordermain = ordermapper.readmainid(ordermain); //역순으로 조회하여 가장큰 om_code
		List<CartsubVO> cartsub = cartmapper.getListCart(cartmain); //한꺼번에 insert하는 쿼리가 없어서 있는로직으로 하기위해 loop으로 돌려서 각각insert	
		for(CartsubVO item : cartsub) { //장바구니에 있는 모든 상품들을 insert
			OrdersubVO ordersub = new OrdersubVO();
			ordersub.setOm_code(ordermain.getOm_code());
			ordersub.setP_code(item.getP_code());
			ordersub.setOs_cnt(item.getCs_cnt());
			ordermapper.insertsub(ordersub);
		}
		
		cartmapper.deletesuball(cartmain); //장바구니 상세 삭제 (cm_code활용)
		cartmapper.deletemain(cartmain); //장바구니 메인(영수증) 삭제 (cm_code활용)
		
		return ordermain;
		
	}
	
	@Override
	public List<OrderdetailDTO> getListOrderDetail(OrdermainVO ordermain) {
		return ordermapper.getListOrderDetail(ordermain);
	}
	
	@Override
	public OrdermemberDTO getOrderTotal(OrdermainVO ordermain) {
		return ordermapper.getOrderTotal(ordermain);
	}			
				
	
}
