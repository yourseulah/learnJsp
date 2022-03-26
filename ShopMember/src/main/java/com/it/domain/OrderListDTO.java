package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListDTO {
	private int om_code;
	private String m_id;
	private Date om_rdate;
	private int os_code;
	private int p_code;
	private String p_name;
	private int p_price;
	private int os_cnt;
	private int os_money;
}
