package come.it.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.MemberVO;
import com.it.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTest {
	@Setter(onMethod_ = @Autowired)
	private MemberService service; //멤버변수선언
	
	//@Test 
	public void testRead() { //빈가방을 만든다
		MemberVO member = new MemberVO();
		member.setM_id("일번");
		member = service.read(member);
		log.info(member);
	}
	
	//@Test
	public void testAuth() {
		MemberVO member = new MemberVO();
		member.setM_id("서창빈");
		member.setM_passwd("123");
		service.auth(member);
	}
	
	//@Test
	public void testGetList() {
		service.getList().forEach(member -> log.info(member)); //변수명은 아무거나
	}
	
	//@Test
	public void testInsert() {
		MemberVO member = new MemberVO();
		member.setM_id("2");
		member.setM_passwd("강아지");
		member.setM_name("김승민");
		service.insert(member);
		log.info(member);
	}
	
	//@Test
	public void testUpdate() {
		MemberVO member = new MemberVO();
		member.setM_id("1");
		member.setM_passwd("뽁아리");
		member.setM_name("필릭스");
		service.update(member);
		log.info(member);
	}
	
	//@Test
	public void testDelete() {
		MemberVO member = new MemberVO();
		member.setM_id("이번");
		service.delete(member);
	}
	
	
}
