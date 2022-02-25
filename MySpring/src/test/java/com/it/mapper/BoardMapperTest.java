package com.it.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.BoardVO;
import com.it.domain.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {
	//테스트 메서드는 반환 받는게 없으니까 다 생성 업데이트도 다 void 
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	// BoardMapper 인터페이스의 mapper변수/객체를 선언만 해놓고 생성이 안되어 있는데 밑에서 갔다가 쓸수 있는 이유는 
	// 기본생성을 @Setter 를통해 (의존성주입 dependency injection) 해주었기때문이다.
	
	@Test
	public void testGetList() { //전체를 읽는것
		PageDTO page = new PageDTO(2, 10); //pagination을 위한 생성자
		mapper.getList(page).forEach(board ->log.info(board)); //레코드만큼 반복하는 람다식
	}
	
	//@Test
	public void testInsert() { //추가
		BoardVO board = new BoardVO();
		//board는 DB에 넣기위한 가방 
		
		board.setB_subject("게시판테스트입니다.");
		board.setB_name("홍길동");
		board.setB_contents("게시판입니다.");
		mapper.insert(board); //board객체를 테이블에 넣는 문법 
		//log.info(board); 
		//board객체생성이 잘 만들어 졌는지, 즉 데이터가 만들어졌는지 확인하기 위한 로그찍기
		//b_num이나 b_date는 데이터베이스가 찍어주는 건데 지금 확인만한거니까 
		//b_num=0이나 b_date=null으로 나오는것
	}
	
	//@Test
	public void testRead() { //특정id의 레코드 읽기
		BoardVO board = new BoardVO();
		board.setB_num(6); //2번을 VO객체에 저장 
		
		//반환받는게 있다면 비어있는 객체를 생성해서 받아와야함 
		board = mapper.read(board); //read 매서드 호출해서 객체 반환 
		log.info(board); 
	}
	
	//@Test
	public void testUpdate() { //업뎃
		BoardVO board = new BoardVO();
		board.setB_num(6);
		board.setB_subject("게시판 수정합니다2.");
		board.setB_name("홍길동수정2");
		board.setB_contents("게시판입니다!!! 수정2!");
		mapper.update(board);
	}
	
	//@Test
	public void testDelete() { //삭제
		BoardVO board = new BoardVO();
		board.setB_num(5);
		mapper.delete(board);
	}
	
	//이로서 CRUD 완료!!! 
	
	
}
