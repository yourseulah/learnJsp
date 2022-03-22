package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.Board2VO;
import com.it.domain.PageDTO;
import com.it.mapper.Board2Mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j	
@Service 
public class Board2ServiceImpl implements Board2Service {
		//mapper에서 하던일을 자바코드로 만드는 과정
		@Setter(onMethod_ = @Autowired)
		private Board2Mapper mapper;
		
		@Override //BoardService인터페이스에서 선언된 메서드 이름과 동일하게 
		public Board2VO read(Board2VO board) {
			return mapper.read(board);
		}
		
		@Override
		public void insert(Board2VO board) { //사용자로부터(맨위계층-웹브라우저에서) 내려오는 내용
			mapper.insert(board);
		}
		
		@Override
		public List<Board2VO> getList(PageDTO page) {
			return mapper.getList(page);
		}
		
		@Override
		public void update(Board2VO board) {
			mapper.update(board);
		}
		
		@Override
		public void delete(Board2VO board) {
			mapper.delete(board);
		}
		
		@Override
		public int getTotalCount() {
			return mapper.getTotalCount();
		}
		
}
