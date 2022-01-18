package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO { //@Data annotation으로 get set 생성해줌 
	//테이블하고 같은 오더로 멤버면수 명칭을 일치시킨다  
	private int b_num; //기본변수
	private String b_subject; //객체변수
	private String b_name; //객체변수
	private String b_contents;//객체변수
	private Date b_date; //객체변수
	
	//기본변수 8개 int, float, double (소문자로 시작)
	//객체변수 8개를 제외한 나머지 (대문자로 시작)
	//num와 date는 입력시키는게 아니고 나머지 3개만 입력하므로
	//BoardMapper.xml파일에서 insert 구문에서 #으로 표시
}
