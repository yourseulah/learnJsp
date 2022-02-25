package come.it.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.BoardVO;
import com.it.domain.PageDTO;
import com.it.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {

	@Setter(onMethod_ = @Autowired)
	private BoardService service; //멤버변수선언
	
	//@Test 
	public void testRead() { //빈가방을 만든다
		BoardVO board = new BoardVO();
		board.setB_num(1); //1번을 받는다
		board = service.read(board); //그위에 나머지 받는다
		log.info(board);
	}
	
	//@Test
	public void testGetList() {
		PageDTO page = new PageDTO();
		service.getList(page).forEach(board -> log.info(board)); //변수명은 아무거나
	}
	
	//@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setB_subject("게시판입력테스트.service");
		board.setB_name("현지니");
		board.setB_contents("테스트입니다");
		service.insert(board);
		log.info(board);
	}
	
	//@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setB_num(8);
		board.setB_subject("게시판입력테스트.service");
		board.setB_name("필릭스");
		board.setB_contents("테스트.service");
		service.update(board);
		log.info(board);
	}
	
	//@Test
	public void testDelete() {
		BoardVO board = new BoardVO();
		board.setB_num(7);
		service.delete(board);
		log.info(board);
	}
	
}
