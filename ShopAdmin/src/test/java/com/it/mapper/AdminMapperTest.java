package com.it.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.AdminVO;
import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTest {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper nmapper;

	//@Test
		public void testRead() { //특정id의 레코드 읽기
			AdminVO admin = new AdminVO();
			admin.setA_id("admin");
			admin.setA_passwd("1234");
			admin = mapper.read(admin);
			log.info(admin);
		
		}
		
		@Test
		public void testGetList() {
			PageDTO page = new PageDTO();
			NoticeVO notice = new NoticeVO();
			notice.setN_num(1);
			page.setPageAmount(10);
			page.setPageNum(1);
			log.info(nmapper.getNotice(page));
			log.info(nmapper.read(notice));
			
		}
	
}
