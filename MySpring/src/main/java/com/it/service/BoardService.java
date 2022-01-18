package com.it.service;

import java.util.List;

import com.it.domain.BoardVO;

public interface BoardService {
	
	public BoardVO read (BoardVO baord); //단일레코드조회
	
	public void insert (BoardVO board); //레코드입력
	
	public List<BoardVO> getList(); //전체레코드조회
	
	public void update(BoardVO board); //레코드수정
	
	public void delete(BoardVO board); //레코드삭제
}
