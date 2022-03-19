package com.it.mapper;

import java.util.List;

import com.it.domain.PageDTO;
import com.it.domain.ProductVO;

public interface ProductMapper {

	public List<ProductVO> getList(PageDTO page);
	
	public int getTotalCount();
	
	public void insert(ProductVO product);
	
	public ProductVO read(ProductVO product);
	
	public void update(ProductVO product);
	
	public void delete(ProductVO product);
	
}
