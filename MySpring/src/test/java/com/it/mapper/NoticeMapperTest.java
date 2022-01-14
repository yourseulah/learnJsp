package com.it.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTest {

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	//@Test
	public void testGetNotice() {
		mapper.getNotice().forEach(notice -> log.info(notice));
	}
	
	//@Test
	public void testInsert() {
		NoticeVO notice = new NoticeVO();
		notice.setN_subject("공지사항테스트입니다.");
		notice.setN_name("이슬아");
		notice.setN_contents("공지사항");
		//log.info(notice);
		mapper.insert(notice);
	}
	
	//@Test
	public void testRead() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(2); 
		notice = mapper.read(notice);
		//log.info(notice);
		log.info(mapper.read(notice)); //리턴받는거니까 
	}
	
	//@Test
	public void testUpdate() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(2);
		notice.setN_subject("게시판내용 수정합니다.");
		notice.setN_name("슬아");
		notice.setN_contents("게시판내용 수정123");
		//log.info(notice);
		mapper.update(notice);
	}
	
	@Test
	public void testDelete() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(3);
		mapper.delete(notice);
	}
	
	
	
}
