package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartsubVO {
	private int cs_code;
	private int cm_code;
	private int p_code;
	private int cs_cnt;
	private Date cs_rdate;
	private Date cs_udate;
}
