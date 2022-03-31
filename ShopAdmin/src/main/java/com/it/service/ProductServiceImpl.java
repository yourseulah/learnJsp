package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.ProductVO;
import com.it.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j	
@Service
public class ProductServiceImpl implements ProductService {
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getList() {
		return mapper.getList();
	}
	
	/*
	 * @Override public List<ProductVO> getList(PageDTO page) { return
	 * mapper.getList(page); }
	 */
	
	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
	
	@Override
	public ProductVO read(ProductVO product) {
		return mapper.read(product);
	}
	
	@Override
	public void insert(ProductVO product) { //사용자로부터(맨위계층-웹브라우저에서) 내려오는 내용
		mapper.insert(product);
	}
	
	@Override
	public void update(ProductVO product) {
		mapper.update(product);
	}
	
	@Override
	public void delete(ProductVO product) {
		mapper.delete(product);
	}
	
}
