package com.it.mapper;

import java.util.List;

import com.it.domain.CartmainVO;
import com.it.domain.CartsubVO;

public interface CartMapper     {
	
	public List<CartmainVO> getListMain(); //List는 다중레코드 
	
	public List<CartsubVO> getListSub();
	
	public List<CartsubVO> getListCart(CartsubVO cartsub); //특정 cm_code의 장바구니 상품리스트
	
	public CartmainVO readmain(CartmainVO cartmain); //read는 싱글레코드
	
	public CartmainVO readmainid(CartmainVO cartmain);
	
	public CartsubVO readsubproduct(CartsubVO cartsub);
	
	public CartsubVO readsub(CartsubVO cartsub);
	
	public void insertmain(CartmainVO cartmain);
	
	public void insertsub(CartsubVO cartsub);
	
	public void updatesub(CartsubVO cartsub);
	
	public void deletemain(CartmainVO cartmain);
	
	public void deletesub(CartsubVO cartsub);
	
}
