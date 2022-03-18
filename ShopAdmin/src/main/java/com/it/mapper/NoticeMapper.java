package com.it.mapper;

import java.util.List;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;

public interface NoticeMapper {
	
	//notice를 안넘겼으니까 NoticeMapper.xml에서 getNotice함수에서는 #기호를 쓸수 없다.
	public List<NoticeVO> getNotice(PageDTO page);
	
	//하기 4개 메서드는 notice를 넘겼으니까 BoardMapper.xml에서 #기호를 쓸수 있다.
	public void insert(NoticeVO notice);
	
	public NoticeVO read(NoticeVO notice);
	
	public void update(NoticeVO notice);
	
	public void delete(NoticeVO notice);
	
	public int getTotalCount();
	
}
