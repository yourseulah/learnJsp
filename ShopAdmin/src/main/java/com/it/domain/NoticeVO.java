package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int n_num;
	private String n_subject;
	private String n_name;
	private String n_contents;
	private Date n_date;
}
