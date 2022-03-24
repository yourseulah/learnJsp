package com.it.domain;

import lombok.Data;

@Data
public class OrdermemberDTO {
	private int om_code;
	private String m_id;
	private String m_name;
	private int om_total;
}
