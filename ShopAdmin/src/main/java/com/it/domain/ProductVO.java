package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

	private int p_code;
	private String p_name;
	private int p_price;
	private int p_stock;
	private int p_soldout;
	private Date p_rdate;
	private Date p_udate;
	
}
