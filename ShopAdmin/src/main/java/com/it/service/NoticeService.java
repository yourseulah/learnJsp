package com.it.service;

import java.util.List;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;

public interface NoticeService {
	
	public NoticeVO read(NoticeVO notice); //단일레코드조회
	
	public void insert(NoticeVO notice); //레코드입력
	
	public List<NoticeVO> getNotice(PageDTO page); //전체레코드조회
	
	public void update(NoticeVO notice); //레코드수정
	
	public void delete(NoticeVO notice); //레코드삭제
	
	public int getTotalCount();
 }
