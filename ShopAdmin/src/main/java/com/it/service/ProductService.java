package com.it.service;

import java.util.List;

import com.it.domain.ProductVO;

public interface ProductService {
	
	public List<ProductVO> getList(); //전체레코드조회
	//public List<ProductVO> getList(PageDTO page);
	
	public int getTotalCount();
	
	public ProductVO read(ProductVO product); //단일레코드조회
	
	public void insert(ProductVO product); //레코드입력
	
	public void update(ProductVO product); //레코드수정
	
	public void delete(ProductVO product); //레코드삭제
	
}
