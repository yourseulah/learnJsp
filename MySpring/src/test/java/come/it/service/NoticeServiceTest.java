package come.it.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;
import com.it.service.NoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTest {

	@Setter(onMethod_ = @Autowired)
	private NoticeService service; 
	
	//@Test
	public void testRead() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(1);
		notice = service.read(notice);
		log.info(notice);
	}
	
	//@Test
	public void testGetNotice() {
		PageDTO page = new PageDTO();
		service.getNotice(page).forEach(notice->log.info(notice));
	}
	
	//@Test
	public void testInsert() {
		NoticeVO notice = new NoticeVO();
		notice.setN_subject("안녕");
		notice.setN_name("이리노");
		notice.setN_contents("서비스 테스트단계입니다");
		service.insert(notice);
		log.info(notice);
	}
	
	//@Test
	public void testUpdate() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(5);
		notice.setN_subject("안녕");
		notice.setN_name("서창빈");
		notice.setN_contents("서비스단계테스트");
		service.update(notice);
		log.info(notice);
	}

	//@Test
	public void testDelete() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(5);
		service.delete(notice);
		log.info(notice);
	}
	
	
	
}
