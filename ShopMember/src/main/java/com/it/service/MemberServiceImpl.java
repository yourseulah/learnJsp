package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.it.domain.MemberVO;
import com.it.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j	
@Service 
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override 
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}
	
	
	@Override
	public void regist(MemberVO member) { 
		String encPasswd = bCryptPasswordEncoder.encode(member.getM_passwd()); //암호화
		member.setM_passwd(encPasswd);
		mapper.regist(member);
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
