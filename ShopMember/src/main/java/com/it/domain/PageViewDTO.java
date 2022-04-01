package com.it.domain;

import lombok.Data;

@Data
public class PageViewDTO {

	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private int realend; // 마지막페이지번호
	private boolean prev; 
	private boolean next;
	private int total; //전체레코드수
	
	//PageDTO를 객체로 받기
	//입력된 page로 나머지 변수를 계산
	PageDTO page;
	
	public PageViewDTO(PageDTO page, int total) { //현재 페이지와 전체 레코드 개수 전달
		this.page = page;
		this.total = total;
		//마지막페이지값을 알기위해 나눗셈을 한뒤에 무조건올림을해서 
		//1-10페이지의 마지막페이지는 10
		//11-20페이지의 마지막페이지는 20 
		this.endPage = (int)Math.ceil(page.getPageNum() / 10.0) * 10;
		//1-10페이지의 첫번째페이지는 1
		//11-20페이지의 첫번째페이지는 11
		this.startPage = this.endPage - 10 + 1;
		this.realend = (int)Math.ceil(total / (double)page.getPageAmount()); //실제 마지막 페이지번호 (실제 row숫자)
		if (this.realend < this.endPage) {
			this.endPage = this.realend; //147개 일때 realend페이지가 15, endPage도 15로 된상태
		}
		this.prev = this.startPage > 1; //최소한 시작이 11페이지일 경우 참
		this.next = this.endPage < this.realend; //endPage는 시시각각 바뀌는 값이고 realend값은 고정값 따라서 참, 거짓 둘다 나올수 있음
	}
}
