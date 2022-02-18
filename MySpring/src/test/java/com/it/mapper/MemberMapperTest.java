package com.it.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTest {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	// MemberMapper 인터페이스의 mapper변수/객체를 선언만 해놓고 생성이 안되어 있는데 밑에서 갔다가 쓸수 있는 이유는 
	// 기본생성을 @Setter 를통해 (의존성주입 dependency injection) 해주었기때문이다.
	
	//@Test
	public void testGetList() { //전체를 읽는것
		mapper.getList().forEach(member ->log.info(member)); //레코드만큼 반복하는 람다식
	}
	
	//@Test
	public void testInsert() { //추가
		MemberVO member = new MemberVO();
		
		member.setM_id("1");
		member.setM_passwd("섹시킹");
		member.setM_name("현지니");
		mapper.insert(member);
		log.info(member);
	}
	
	//@Test
	public void testRead() { //특정id의 레코드 읽기
		MemberVO member = new MemberVO();
		
		member.setM_id("첫번째");
		member = mapper.read(member);
		log.info(member);
	}
	
	//@Test
	public void testUpdate() { //업뎃
		MemberVO member = new MemberVO();
		member.setM_id("쿼카");
		member.setM_passwd("쿼카");
		member.setM_name("한");
		mapper.update(member);
		log.info(member);
	}
	
	//@Test
	public void testDelete() { //삭제
		MemberVO member = new MemberVO();
		member.setM_id("첫번째");
		mapper.delete(member);
	}
	
	//이로서 CRUD 완료!!! 
	
	
	
	
}
