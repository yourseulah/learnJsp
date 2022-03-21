package com.it.service;

import com.it.domain.AdminVO;

public interface AdminService {

	public boolean auth (AdminVO admin);
	
	public AdminVO read (AdminVO admin);
}
