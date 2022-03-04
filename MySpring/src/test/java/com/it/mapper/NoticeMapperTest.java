package com.it.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTest {

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	
	//@Test
	public void testGetNotice() { //전체읽기
		PageDTO page = new PageDTO(2, 10);
		mapper.getNotice(page).forEach(notice->log.info(notice));
		 //레코드만큼 반복하는 람다식
	}
	
	//@Test
	public void testInsert() { //입력
		NoticeVO notice = new NoticeVO();
		notice.setN_subject("안녕");
		notice.setN_name("서창빈");
		notice.setN_contents("spring프래임워크");
		mapper.insert(notice); //notice 객체를 테이블에 넣는 문법
		log.info(notice); 
		//notice객체생성이 잘 만들어 졌는지, 즉 데이터가 만들어졌는지 확인하기 위한 로그찍기
		//b_num이나 b_date는 데이터베이스가 찍어주는 건데 지금 확인만한거니까 
		//b_num=0이나 b_date=null으로 나오는것
	}
	
	//@Test
	public void testRead() { //특정레코드읽기
		NoticeVO notice = new NoticeVO();
		notice.setN_num(1); // 1번을 notice객체에 저장 
		//반환받는게 있다면 비어있는 객체를 생성해서 아와야 함
		notice = mapper.read(notice);
		log.info(notice);
	}
	
	//@Test
	public void testUpdate() { //업데이트
		NoticeVO notice = new NoticeVO();
		notice.setN_num(2);
		notice.setN_subject("안녕");
		notice.setN_name("한지성");
		notice.setN_contents("자바프로그래밍 잘하고싶다");
		mapper.update(notice);
	}
	
	//@Test
	public void testDelete() { //삭제
		NoticeVO notice = new NoticeVO();
		notice.setN_num(3);
		mapper.delete(notice);
	}
	
	
	
	
}
