package com.it.domain;

import lombok.Data;

@Data
public class PageViewDTO {

	//화면에 뿌려줄 멤버변수 반들기
	//시작과 끝번호
	//이전 다음
	//맨처음으로 맨끝으로 
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int total;
	
	//PageDTO를 객체로 받기
	PageDTO page; //입력된 page로 나머지 변수를 계산
	
	public PageViewDTO(PageDTO page, int total) { //현재 페이지와 전체 레코드 개수 전달
		this.page = page;
		this.total = total;
		//마지막페이지값을 알기위해 나눗셈을 한뒤에 무조건올림을해서 
		//1-10페이지의 마지막페이지는 10
		//11-20페이지의 마지막페이지는 20 
		this.endPage = (int)Math.ceil(page.getPageNum() / (double)page.getPageAmount()) * page.getPageAmount();
		//1-10페이지의 첫번째페이지는 1
		//11-20페이지의 첫번째페이지는 11
		this.startPage = this.endPage - page.getPageAmount()+1;
		int realend = (int)Math.ceil(total / page.getPageAmount()); //실제 마지막 페이지번호
		if (realend < this.endPage) {
			this.endPage = realend;
		}
		this.prev = this.startPage > 1; //최소한 시작이 11페이지일 경우 참
		this.next = this.endPage < realend;
	}
	     
	
}
