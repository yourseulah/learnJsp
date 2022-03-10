package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.BoardVO;
import com.it.domain.PageDTO;
import com.it.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j	//로그 추출 log.info() 쓸수있게
@Service //인터페이스를 구현하는데 필요한 내용을 담고 있다
public class BoardServiceImpl implements BoardService {
//mapper에서 하던일을 자바코드로 만드는 과정
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override //BoardService인터페이스에서 선언된 메서드 이름과 동일하게 
	public BoardVO read(BoardVO board) {
		return mapper.read(board);
	}
	
	@Override
	public void insert(BoardVO board) { //사용자로부터(맨위계층-웹브라우저에서) 내려오는 내용
		mapper.insert(board);
	}
	
	@Override
	public List<BoardVO> getList(PageDTO page) {
		return mapper.getList(page);
	}
	
	@Override
	public void update(BoardVO board) {
		mapper.update(board);
	}
	
	@Override
	public void delete(BoardVO board) {
		mapper.delete(board);
	}
	
	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
	
	
}
