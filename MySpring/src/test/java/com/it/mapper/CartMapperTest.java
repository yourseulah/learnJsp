package com.it.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.CartmainVO;
import com.it.domain.CartsubVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	//@Test
	public void testGetListMain() {
		mapper.getListMain().forEach(cartmain ->log.info(cartmain));
	}
	
	//@Test
	public void testGetListSub() {
		mapper.getListSub().forEach(cartsub ->log.info(cartsub));
	}
	
	//@Test
	public void testInsertMain() {
		CartmainVO cartmain = new CartmainVO();
		cartmain.setM_id("tiger");
		mapper.insertmain(cartmain);
		log.info(cartmain);
		
	}
	
	//@Test
	public void testInsertSub() {
		CartsubVO cartsub = new CartsubVO();
		cartsub.setCm_code(1005);
		cartsub.setP_code(1001);
		cartsub.setCs_cnt(2);
		mapper.insertsub(cartsub);
		log.info(cartsub);
		cartsub.setCm_code(1005);
		cartsub.setP_code(1002);
		cartsub.setCs_cnt(7);
		mapper.insertsub(cartsub);
		log.info(cartsub);
	}
	
	//@Test
	public void testReadMain() {
		CartmainVO cartmain = new CartmainVO();
		cartmain.setCm_code(1003);
		cartmain = mapper.readmain(cartmain);
		log.info(cartmain);
	}
	
	//@Test
	public void testReadSub() {
		CartsubVO cartsub = new CartsubVO();
		cartsub.setCs_code(1005);
		cartsub = mapper.readsub(cartsub);
		log.info(cartsub);
	}
	
	
	//@Test
	public void testUpdateSub() {
		CartsubVO cartsub = new CartsubVO();
		cartsub.setCs_code(1005);
		cartsub.setCs_cnt(2);
		mapper.updatesub(cartsub);
		log.info(cartsub);
	}
	
	
	//삭제시에는 sub부터
	
	//@Test
	public void testDeleteSub() {
		CartsubVO cartsub = new CartsubVO();
		cartsub.setCs_code(1009);
		mapper.deletesub(cartsub);
		cartsub.setCs_code(1010);
		mapper.deletesub(cartsub);
	}
	
	//@Test
	public void testDeleteMain() {
		CartmainVO cartmain = new CartmainVO();
		cartmain.setCm_code(1005);
		mapper.deletemain(cartmain);
	}
	
}
