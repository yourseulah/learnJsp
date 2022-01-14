package com.it.mapper;

import java.util.List;

import com.it.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> getNotice();
	
	public void insert(NoticeVO notice);
	
	public NoticeVO read(NoticeVO notice);
	
	public void update(NoticeVO notice);
	
	public void delete(NoticeVO notice);
	
}
