package com.it.mapper;

import java.util.List;

import com.it.domain.MemberVO;
import com.it.domain.PageDTO;

public interface MemberMapper {

		public List<MemberVO> getList(PageDTO page);
		
		public int getTotalCount();
		
		public void insert(MemberVO member);
		
		//public MemberVO auth(MemberVO member); 좋은 방법이 아님 
		
		public MemberVO read(MemberVO member);
		//하나 넘기더라도 5개짜리 칸막이가 있는 member가방전체를 넘긴다.
		
		public void update(MemberVO member);
		
		public void delete(MemberVO member);
}
