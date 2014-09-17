package com.shareku.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.shareku.mapper.MobileMapper;
import com.shareku.service.MobileService;

public class MobileSerivceImp implements MobileService{
	@Autowired
	private MobileMapper mobileMapper;

	public void save(String content) {
		// TODO Auto-generated method stub
		mobileMapper.insertMobile(content);
	}
}
