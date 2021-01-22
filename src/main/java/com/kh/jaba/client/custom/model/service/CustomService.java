package com.kh.jaba.client.custom.model.service;

import java.util.List;

import com.kh.jaba.client.custom.model.domain.Custom;

public interface CustomService {
	List<Custom> selectCustomCategoryList(String menu_id);

	List<Custom> selectListByCustomCategory(Custom c);

	public Custom selectOneCustom(Custom c);

	public Custom selectOneCustomByCustomId(String custom_id);

	public List<Custom> selectListByMenuId(String menu_id);

	// custom 한개의 정보를 변경
	public int updateCustom(Custom c);
	
	//custom 추가
	public int insertCustom(Custom c);

	// custom_status 를 2로 변경하여 삭제처리
	public int updateCustomStatus(String custom_id);
	
	// menu_id 를 통해서 custom_status 를 2로 변경하여 삭제처리
	public int updateCustomStatusByMenuId(String menu_id);
}
