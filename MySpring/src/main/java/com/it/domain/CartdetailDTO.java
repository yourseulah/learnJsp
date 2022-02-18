package com.it.domain;

import lombok.Data;

@Data
public class CartdetailDTO { //실제장바구니구조를 생각하면서 작성 (product, cartsub 조인필요)
	private int cs_code;
	private int p_code;
	private String p_name;
	private int p_price;
	private int cs_cnt;
	private int cs_money;
}
