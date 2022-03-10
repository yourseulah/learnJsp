package com.it.domain;

import lombok.Data;

@Data
public class PageDTO {
	private int pageNum;
	private int pageAmount;
	
	//아무것도 주지 않은 첫페이지일경우 ->이런식으로 주소창에 입력했을때 http://192.168.0.15:8080/board/list
	//http://192.168.0.15:8080/board/list?pageNum=1&pageAmount=10 으로 자동 뜨도록
	public PageDTO() {
		this(1,10); //기본값 1, 10
	}
	
	public PageDTO(int pageNum, int pageAmount) {
		this.pageNum = pageNum;
		this.pageAmount = pageAmount;
	}
}
