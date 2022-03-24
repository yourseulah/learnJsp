package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.CartdetailDTO;
import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;
import com.it.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j	
@Service 
public class CartServiceImpl implements CartService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;

	@Override
	public void cartinsert(CartmainVO cartmain, CartsubVO cartsub) {
		//Controller 레벨에서는 로그가찍히는데 그 아래쪽 레벨 인터페이스 구현하는 클라스에서는 안찍힘 
		//그래서 하기와 같이 쓸수 없음
		//log.info("----------장바구니 비즈니스로직 ----------");
		//log.info(cartmain);
		//log.info(cartsub);
		//대신 출력문으로 확인
		//System.out.println(cartmain.getM_id());
		//System.out.println(cartsub.getP_code() + ":" + cartsub.getCs_cnt());
		
		CartmainVO cm = new CartmainVO();
		cm = mapper.readmainid(cartmain); //세션 아이디를 인수로 조회하여 결과 반환, 있으면 레코드 1개, 없으면 null 
		if (cm == null) { //cartmain에 해당사용자의 레코드 1개를 신규생성해야 함
			mapper.insertmain(cartmain); //cartmain에 레코드 추가 
			//cm_code 가 생성되었으나 조회해야 알수 있음
			cm = mapper.readmainid(cartmain); //해당 사용자로 신규 추가 후 조회 (몰랐던 cm_code 알수있음) 
			cartsub.setCm_code(cm.getCm_code()); //조회한 신규cm_code를 cartsub에 추가
			mapper.insertsub(cartsub);
		} else { //이미 최소 1개는 카트에 상품이 존재한다는 의미
			cartsub.setCm_code(cm.getCm_code()); //조회한 신규cm_code를 cartsub에 추가
			CartsubVO cs = new CartsubVO();
			cs = mapper.readsubproduct(cartsub);
			
			if (cs == null) { //선택한 상품이 장바구니에 없다면 
				mapper.insertsub(cartsub);	
			} else { //존재한다면 덧셈하여 치환 - 기존 mapper.updatesub사용
				//int tmp = cs.getCs_cnt() + cartsub.getCs_cnt(); //기존 + 신규  또는
				cs.setCs_cnt(cs.getCs_cnt() + cartsub.getCs_cnt()); //기존 + 신규
				mapper.updatesub(cs);
			}
		}
	}
	
	@Override
	public CartmainVO readcmcode(CartmainVO cartmain) {
		cartmain = mapper.readmainid(cartmain); //특정 사용자 아이디로 조회 
		return cartmain; //cmcode만 필요하지만 cmcode를 포함한 전체레코트값 반환 
		// 개발자마다 스타일이 다르겠지만 쌤이 제안한 스타일은 죄다 가방안에 넣어서 넘기기
	}
	

	@Override 
	public List<CartsubVO> getListCart(CartmainVO cartmain) {
		return mapper.getListCart(cartmain);
	}
	
	@Override
	public List<CartdetailDTO> getListCartDetail(CartmainVO cartmain) {
		return mapper.getListCartDetail(cartmain);
	}
	
	@Override
	public CartmemberDTO getCartTotal(CartmainVO cartmain) {
		return mapper.getCartTotal(cartmain);
	}
	
	@Override
	public void updatesub(CartsubVO cartsub) {
		mapper.updatesub(cartsub);
	}
	
	@Override
	public void deletesub(CartsubVO cartsub) {
		mapper.deletesub(cartsub);
		CartmainVO cartmain = new CartmainVO();
		cartmain.setCm_code(cartsub.getCm_code());
		List<CartsubVO> tmp = mapper.getListCart(cartmain);
		//tmp는 리스트구조이니까 null이 아니라 뭐라도 있다. 그래서 size로 
		if(tmp.size() == 0) { //장바구니에 상품이 1개도 없음
			mapper.deletemain(cartmain); //cartmain 삭제 
		}
		
		//디버깅용 (서비스레벨이니까 출력을 log가 아니라 System.out.println()으로 해보기)
		tmp = mapper.getListCart(cartmain); 
		System.out.println(tmp); //배열표기로 [ ] 
		System.out.println(tmp.size()); //숫자로
	}
	
	@Override
	public void deletesuball(CartmainVO cartmain) {
		mapper.deletesuball(cartmain); //장바구니 상세 삭제 (cm_code활용)
		mapper.deletemain(cartmain); //장바구니 메인(영수증) 삭제 (cm_code활용)
	}
	
	
	
	
	
}



