package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrdersubVO {
	private int os_code;
	private int om_code;
	private int p_code;
	private int os_cnt;
	private Date os_rdate;
	private Date os_udate;
}
