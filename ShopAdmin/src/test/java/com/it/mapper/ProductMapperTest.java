package com.it.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.PageDTO;
import com.it.domain.ProductVO;
import com.it.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTest {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	
	//@Test
	public void testUpdate() {
		ProductVO product = new ProductVO();
		product.setP_code(1);
		product.setP_name("쌤2");
		product.setP_price(100);
		product.setP_soldout(1);
		mapper.update(product);
		log.info(product);
		product = mapper.read(product);
		log.info(product);
	}
	
	@Test
	public void testList() {
		PageDTO page = new PageDTO();
		log.info(mapper.getList(page));
	}
	
}
