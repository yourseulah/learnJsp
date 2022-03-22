package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Board2VO {
	private int b_num; 
	private String b_subject; 
	private String b_name; 
	private String b_contents;
	private String b_file;
	private Date b_rdate; 
	private Date b_udate; 
}
