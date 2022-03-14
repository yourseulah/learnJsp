package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String m_id;
	private String m_passwd;
	private String m_name;
	private Date m_rdate;
	private Date m_udate;
}


