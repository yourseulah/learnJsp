package com.it.mapper;

import java.util.List;

import com.it.domain.CartdetailDTO;
import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;

public interface CartMapper     {
	
	public List<CartmainVO> getListMain(); //List는 다중레코드 
	
	public List<CartsubVO> getListSub();
	
	public List<CartsubVO> getListCart(CartmainVO cartmain); 
	// cartmain안에 cm_code전달 
	// 관리자 점검용
	// 넘겨주는 순간에는 cartmain이고 반환되는순간부터 cartsub
	
	public List<CartdetailDTO> getListCartDetail(CartmainVO cartmain);
	// cartmain안에 cm_code전달  
	// 실제 접속하는 일반사용자용
	
	public CartmemberDTO getCartTotal(CartmainVO carmain); //cart 총금액 
	
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
