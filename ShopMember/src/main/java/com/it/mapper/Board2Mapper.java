package com.it.mapper;

import java.util.List;

import com.it.domain.Board2VO;
import com.it.domain.PageDTO;

public interface Board2Mapper {
	
	public List<Board2VO> getList(PageDTO page);
	
	public int getTotalCount();
	
	public void insert(Board2VO board);
	
	public Board2VO read(Board2VO board);
	
	public void update(Board2VO board);
	
	public void delete(Board2VO board);
}
