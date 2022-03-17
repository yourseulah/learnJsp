package com.it.domain;

import lombok.Data;

@Data
public class CartmemberDTO { //cartmain을 쓰지않는이유는 cm_total이 없어서 
	private int cm_code;//영주증번호
	private String m_id;
	private String m_name;
	private int cm_total;
	
}
