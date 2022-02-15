package com.it.service;

import java.util.List;

import com.it.domain.CartmainVO;
import com.it.domain.CartsubVO;

public interface CartService {
	
	//상품 코드와 수량이 넘어올것임 
	//프레젠테이션레벨부터 고려하자 - submit button누르고 넘어오는거
	// m_id를 cartmain에 넘기고 상품정보는 cartsub에 
	public void cartinsert(CartmainVO cartmain, CartsubVO cartsub);
	
	public CartmainVO readcmcode(CartmainVO cartmain);
	
	public List<CartsubVO> getListCart(CartsubVO cartsub);
}
