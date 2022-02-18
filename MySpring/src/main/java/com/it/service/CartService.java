package com.it.service;

import java.util.List;

import com.it.domain.CartdetailDTO;
import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;

public interface CartService {
	
	//상품 코드와 수량이 넘어올것임 
	//프레젠테이션레벨부터 고려하자 - submit button누르고 넘어오는거
	// m_id를 cartmain에 넘기고 상품정보는 cartsub에 
	public void cartinsert(CartmainVO cartmain, CartsubVO cartsub);
	
	public CartmainVO readcmcode(CartmainVO cartmain);
	//mapper레벨에서와같이 메서드 이름을 readmainid로 해도 상관없음 
	//여기서 받을건 정작 cmcode라서 이름을 readcmcode라고 한것뿐임
	
	public List<CartsubVO> getListCart(CartmainVO cartmain);
	
	public List<CartdetailDTO> getListCartDetail(CartmainVO cartmain);
	
	public CartmemberDTO getCartTotal(CartmainVO cartmain);
	
}
