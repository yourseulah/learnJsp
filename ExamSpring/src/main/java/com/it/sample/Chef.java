package com.it.sample;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;

public class Chef {

	@Setter(onMethod_ = @Autowired)
	private Chef chef;
	
}
