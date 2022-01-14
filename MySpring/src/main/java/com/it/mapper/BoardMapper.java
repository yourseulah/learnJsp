package com.it.mapper;

import java.util.List;

import com.it.domain.BoardVO;

public interface BoardMapper {
	
	//board를 안넘겼으니까 BoardMapper.xml에서 #기호를 쓸수 없다.
	public List<BoardVO> getlist();
	
	//하기 4개 메서드는 board를 넘겼으니까 BoardMapper.xml에서 #기호를 쓸수 있다.
	public void insert(BoardVO board);
	
	public BoardVO read(BoardVO board);
	//하나 넘기더라도 5개짜리 칸막이가 있는 board가방전체를 넘긴다.
	
	public void update(BoardVO board);
	
	public void delete(BoardVO board);
}
