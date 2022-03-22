package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String m_id;
	private String m_passwd;
	private String m_fname;
	private String m_lname;
	private String m_name;
	private String m_email;
	private Date m_rdate;
	private Date m_udate;
}


