package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO { //@Data annotation으로 get set 생성해줌 
	//테이블하고 같은 오더로 멤버면수 명칭을 일치시킨다  
	private int b_num;
	private String b_subject;
	private String b_name;
	private String b_contents;
	private Date b_date;
	//num와 date는 입력시키는게 아니고 나머지 3개만 입력하므로
	//BoardMapper.xml파일에서 insert 구문에서 #으로 표시
}
