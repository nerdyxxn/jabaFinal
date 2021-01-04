package com.kh.jaba.explore.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.explore.model.domain.Search;
import com.kh.jaba.explore.model.service.SearchService;
import com.kh.jaba.index.controller.IndexController;

@Controller
public class ExploreController {

	@Autowired
	private SearchService searchService;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	// 단지 index페이지를 띄워주는행동만 함
	@RequestMapping(value = "/explore/searchBrand.do", method = RequestMethod.POST)
	public ModelAndView explore(ModelAndView mv, HttpServletRequest request) {
		logger.info("----- Brand 검색 진입 -----");
		String brand = request.getParameter("brand");
		String lat2Str = request.getParameter("lat2");
		String lon2Str = request.getParameter("lon2");
		System.out.println("현재위치 : " + lat2Str);
		System.out.println("현재위치 : " + lon2Str);
		double lat2 = Double.parseDouble(lat2Str);
		double lon2 = Double.parseDouble(lon2Str);

		if (brand != null) {
			System.out.println(brand);
			System.out.println("storeList--explore 연결 서블릿 : brand명 검색");
			List<Search> searchBrandList = searchService.searchBrand(brand);
			
			for (int i = 0; i < searchBrandList.size(); i++) {
				Search vo = searchBrandList.get(i);
				double lat1 = Double.parseDouble(vo.getStore_lat());
				double lon1 = Double.parseDouble(vo.getStore_lng());
				double d = Math.round(getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) * 10) / 10.0;
				vo.setStore_distance(d);
				// dList.add(d);
			}
			
			System.out.println("aaa:" + searchBrandList);
			Collections.sort(searchBrandList); // 오름차순 정리
			System.out.println("bbb:" + searchBrandList);
			
			request.getSession().setAttribute("storeList", searchBrandList); // StoreList를 세션으로 넘김
		}
		mv.setViewName("explore/explore");
		return mv;
	}

	private double deg2rad(double deg) {
		return deg * (Math.PI / 180);
	}

	private float getDistanceFromLatLonInKm(double lat1, double lng1, double lat2, double lng2) {
		int R = 6371; // Radius of the earth in km
		double dLat = deg2rad(lat2 - lat1); // deg2rad below
		double dLon = deg2rad(lng2 - lng1);
		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		System.out.println(c);
		float d = R * (float) c; // Distance in km
		System.out.println(d);
		return d;
	}

}