package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;
import com.it.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j  //log.info() 쓸수있게
@Service //인터페이스를 구현하는데 필요한 내용을 담고 있다
public class NoticeServiceImpl implements NoticeService {
	
//mapper에서 하던일을 자바코드로 만드는 과정
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Override //NoticeService인터페이스에서 선언된 메서드 이름과 동일하게 
	public NoticeVO read(NoticeVO notice) {
		return mapper.read(notice);
	}
	
	@Override
	public void insert(NoticeVO notice) {
		mapper.insert(notice);
	}
	
	@Override
	public List<NoticeVO> getNotice(PageDTO page) {
		return mapper.getNotice(page);
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
	
	@Override
	public void update(NoticeVO notice) {
		mapper.update(notice);
	}
	
	@Override
	public void delete(NoticeVO notice) {
		mapper.delete(notice);
	}
	
	
	
}
