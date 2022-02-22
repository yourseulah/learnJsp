package com.it.domain;

import lombok.Data;

@Data
public class OrderdetailDTO {
	private int os_code;
	private int p_code;
	private String p_name;
	private int p_price;
	private int os_cnt;
	private int os_money;
}
