package com.it.service;

import java.util.List;

import com.it.domain.MemberVO;

public interface MemberService {

	
	public MemberVO read (MemberVO member); //단일레코드조회
	
	public boolean auth (MemberVO member); //아이디와 암호를 전달하여 인증 처리 후 참거짓 반환
	
	public void insert (MemberVO member); //레코드입력
	
	public List<MemberVO> getList(); //전체레코드조회
	
	public void update(MemberVO member); //레코드수정
	
	public void delete(MemberVO member); //레코드삭제
	
}
