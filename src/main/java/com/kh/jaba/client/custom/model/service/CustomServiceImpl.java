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

	// custom 한개의 정보를 변경
	@Override
	public int updateCustom(Custom c) {
		return customDao.updateCustom(c);
	}

	@Override
	public int insertCustom(Custom c) {
		return customDao.insertCustom(c);
	}

	@Override
	public int updateCustomStatus(String custom_id) {
		return customDao.updateCustomStatus(custom_id);
	}

	// menu_id 를 통해서 custom_status 를 2로 변경하여 삭제처리
	@Override
	public int updateCustomStatusByMenuId(String menu_id) {
		return customDao.updateCustomStatusByMenuId(menu_id);
	}

}
