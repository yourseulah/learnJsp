package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {
	private String a_id;
	private String a_passwd;
	private String a_name;
	private Date a_rdate;
	private Date a_udate;
}
