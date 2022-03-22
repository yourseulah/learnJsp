package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.MemberVO;
import com.it.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j	//로그 추출 log.info() 쓸수있게
@Service //인터페이스를 구현하는데 필요한 내용을 담고 있다
public class MemberServiceImpl implements MemberService{
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override //MemberService인터페이스에서 선언된 메서드 이름과 동일하게 
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}
	
	@Override
	public boolean auth(MemberVO member) { //사용자가 로그인창에서 입력한 id와 passwd 정보가 들어있는 member변수
		MemberVO tmp = new MemberVO(); //임시변수(비어있는객체)
		tmp = mapper.read(member); 
		// tmp에 사용자가 로그인창에서 입력한 id로 read메서드가 돌아가서 테이블의 나머지 데이터가 물려온다 
		
		// 아이디를 이용해서 모든 필드 정보 획득, 아이디가 틀리면 null 반환 
		// xml파일내 질의문에서 조건절이 id로 읽어서 where m_id = #{m_id}
		
		if(tmp != null) { //아이디가 바른 경우 
			
			if(member.getM_passwd().equals(tmp.getM_passwd())) { //암호동일할경우 
				//member.getM_passwd() : 사용자가 입력한 passwd 
				//tmp.getM_passwd() : id를 가지고 조회한 테이블 레코드의 passwd  
				log.info(tmp); //진짜 정보 들어있고
				log.info("인증성공");
				return true;
			} else { //아이디는 일치하나 암호가 일치하지 않는 경우
				log.info(tmp);
				log.info(member);
				log.info("아이디는 동일하나 암호가 틀림");
				return false;
			}
		} else { // 아이디가 존재하지 않은 경우
			log.info(member);
			log.info("아이디가 존재하지 않음");
			return false;
		}
	
	}
	
	@Override
	public void insert(MemberVO member) { //사용자로부터(맨위계층-웹브라우저에서) 내려오는 내용
		mapper.insert(member);
	}
	
	@Override
	public List<MemberVO> getList() {
		return mapper.getList();
	}
	
	
	@Override
	public void update(MemberVO member) {
		mapper.update(member);
	}
	
	@Override
	public void delete(MemberVO member) {
		mapper.delete(member);
	}
	
	
}
