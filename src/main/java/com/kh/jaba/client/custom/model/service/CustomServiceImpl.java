package com.kh.jaba.client.custom.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.custom.model.dao.CustomDao;
import com.kh.jaba.client.custom.model.domain.Custom;

@Service("customService")
public class CustomServiceImpl implements CustomService {

	@Autowired
	private CustomDao customDao;
	
	@Autowired
	private Custom custom;
	
	@Override
	public List<Custom> selectCustomCategoryList(String menu_id) {
		return customDao.selectCustomCategoryList(menu_id);
	}

	@Override
	public List<Custom> selectListByCustomCategory(Custom c) {
		return customDao.selectListByCustomCategory(c);
	}

	@Override
	public Custom selectOneCustom(Custom c) {
		return customDao.selectOneCustom(c);
	}

	@Override
	public Custom selectOneCustomByCustomId(String custom_id) {
		return customDao.selectOneCustomByCustomId(custom_id);
	}

	@Override
	public List<Custom> selectListByMenuId(String menu_id) {
		return customDao.selectListByMenuId(menu_id);
	}
	
	
}
