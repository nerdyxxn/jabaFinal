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

@Controller
public class ExploreController {

	@Autowired
	private SearchService searchService;
	
	private static final Logger logger = LoggerFactory.getLogger(ExploreController.class);
	
	// brand-badge 검색 시 해당 브랜드 list 출력
	@RequestMapping(value = "/explore/searchBrand.do", method = RequestMethod.POST)
	public ModelAndView searchBrand(ModelAndView mv, HttpServletRequest request) {
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
			System.out.println("storeList--explore 연결 : brand명 검색");
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
	
	// 주소 검색 시 해당 주소에 속한 store list 출력
	@RequestMapping(value = "/explore/searchAddr.do", method = RequestMethod.POST)
	public ModelAndView searchAddr(ModelAndView mv, HttpServletRequest request) {
		logger.info("----- Addr 검색 진입 -----");
		//index.jsp에서 주소 검색 input text 속 value가 addr로 들어온다.
		String addr = request.getParameter("addr");
		//값을 잘 들고 들어오나 log 확인
		System.out.println(addr);


		String lat2Str = request.getParameter("lat2");
		String lon2Str = request.getParameter("lon2");
		System.out.println("현재위치 : " + lat2Str);
		System.out.println("현재위치 : " + lon2Str);
		double lat2 = Double.parseDouble(lat2Str);
		double lon2 = Double.parseDouble(lon2Str);

		if (addr != null) {
			System.out.println(addr);
			System.out.println("storeList--explore 연결  : 주소명 검색");
			List<Search> searchBrandList = searchService.searchAddr(addr);
			
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
	// 주소 검색 시 해당 주소에 속한 store list 출력
		@RequestMapping(value = "/explore/searchLoc.do", method = RequestMethod.POST)
		public ModelAndView searchLoc(ModelAndView mv, HttpServletRequest request) {
			logger.info("----- Loc 검색 진입 -----");
			//값을 잘 들고 들어오나 log 확인
			String lat2Str = request.getParameter("lat2");
			String lon2Str = request.getParameter("lon2");
			System.out.println("현재위치 : " + lat2Str);
			System.out.println("현재위치 : " + lon2Str);
			double lat2 = Double.parseDouble(lat2Str);
			double lon2 = Double.parseDouble(lon2Str);

			System.out.println("storeList--explore 연결  : 모든 store list 출력");
			List<Search> searchBrandList = searchService.searchLoc();
				
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
			// 모든 store 정보들이 searchBrandList에 담겨있다.
			System.out.println(searchBrandList.size());
			//뒤에서부터 21번째까지 제거
			for (int j = searchBrandList.size()-1; j > 20; j--) {
				searchBrandList.remove(j);
			}
			
			System.out.println(searchBrandList.size());
			request.getSession().setAttribute("storeList", searchBrandList); // StoreList를 세션으로 넘김
				
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
