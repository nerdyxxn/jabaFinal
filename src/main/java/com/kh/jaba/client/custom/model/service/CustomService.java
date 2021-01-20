package com.kh.jaba.client.custom.model.service;

import java.util.List;

import com.kh.jaba.client.custom.model.domain.Custom;

public interface CustomService {
	List<Custom> selectCustomCategoryList(String menu_id);
	
	List<Custom> selectListByCustomCategory(Custom c);
	
	public Custom selectOneCustom(Custom c);
	
	public Custom selectOneCustomByCustomId(String custom_id);
	
	public List<Custom> selectListByMenuId(String menu_id);

}
