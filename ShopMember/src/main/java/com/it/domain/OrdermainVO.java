package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrdermainVO {
	private int om_code;
	private String m_id;
	private Date om_rdate;
	private Date om_udate;
}
