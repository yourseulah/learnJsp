package com.it.service;

import java.util.List;

import com.it.domain.BoardVO;
import com.it.domain.PageDTO;

public interface BoardService {
	
	public BoardVO read (BoardVO baord); //단일레코드조회
	
	public void insert (BoardVO board); //레코드입력
	
	public List<BoardVO> getList(PageDTO page); 
	//전체레코드조회 //Pagination을위해 parameter 줌
	
	public void update(BoardVO board); //레코드수정
	
	public void delete(BoardVO board); //레코드삭제
	
	public int getTotalCount();
	
}
