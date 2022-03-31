package com.it.service;

import java.util.List;

import com.it.domain.Board2VO;
import com.it.domain.PageDTO;

public interface Board2Service {
	
	public List<Board2VO> getList(PageDTO page); //전체레코드조회
	public int getTotalCount();
	
	public Board2VO read (Board2VO baord); //단일레코드조회
	
	public void insert (Board2VO board); //레코드입력
	
	public void update(Board2VO board); //레코드수정
	
	public void delete(Board2VO board); //레코드삭제
	
	
}
