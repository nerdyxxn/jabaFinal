package com.kh.jaba.admin.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.biz.model.service.BizService;
import com.kh.jaba.client.custom.model.domain.Custom;
import com.kh.jaba.client.custom.model.service.CustomService;
import com.kh.jaba.client.menu.model.domain.Menu;
import com.kh.jaba.client.menu.model.service.MenuService;
import com.kh.jaba.client.model.domain.Client;

@Controller
public class AdminStoreContoller {
   @Autowired
   private MenuService menuService;

   @Autowired
   private Menu menu;
   
   @Autowired
   private BizService bizService;
   
   @Autowired
   private Biz biz;
   
   @Autowired
   private CustomService customService;
   
   @Autowired
   private Custom custom;
   
   @RequestMapping(value = "admin/store/selectAdminStore.do", method = RequestMethod.GET)
   public ModelAndView selectAdminStore(ModelAndView mv, HttpServletRequest request) {
      List<Biz> storeList = bizService.selectAllStore();
      System.out.println(storeList.size() + "개의 Biz 정보 가져옴");
      
      request.getSession().setAttribute("storeList", storeList);
      
      mv.setViewName("admin/adminStore");
      return mv;
   }
   
   
   @RequestMapping(value = "admin/store/adminStoreDetail.do", method = RequestMethod.GET)
   public ModelAndView adminStoreDetail(ModelAndView mv, HttpServletRequest request) {
      String store_name = request.getParameter("store_name");
      System.out.println(store_name);
      // 스토어의 Detail 정보 
      Biz storeDetail = bizService.selectStoreByName(store_name);
      request.getSession().setAttribute("storeDetail", storeDetail);
      System.out.println(storeDetail);
      // 메뉴정보 List 
      List<Menu> menuList = menuService.selectMenuList(storeDetail.getStore_id());
         request.getSession().setAttribute("menuList", menuList);
         System.out.println(menuList);
      System.out.println(storeDetail.getStore_name() + "의 메뉴정보 " + menuList.size() + "개를 가져왔음");
      mv.setViewName("admin/adminStoreDetail");
      return mv;
   }
   
   // 매장 Detail 정보 수정 페이지로 이동
      @RequestMapping(value = "/admin/store/updateStoreDetail.do", method = RequestMethod.GET)
      public ModelAndView updateStoreDetail(ModelAndView mv, HttpServletRequest request) {
         
         mv.setViewName("admin/adminStoreUpdate");
         return mv;
      }
   
   
   // 매장 Detail 정보 수정
   @RequestMapping(value = "/admin/store/updateStore.do", method = RequestMethod.POST)
   @ResponseBody
   public void updateStore(HttpServletRequest request) {
      Biz storeDetail = (Biz)request.getSession().getAttribute("storeDetail");
      String store_id = storeDetail.getStore_id();
      String store_time = null;
      String store_description = null;
      String store_img = null;
      
      // store_time 이 받아온 값이 있으면 받아온 값을 넣어주고 아니면 기존 값을 사용
      if(request.getParameter("store_time") != null) {
         store_time = request.getParameter("store_time");
      }else {
         store_time = storeDetail.getStore_time();
      }
      
      if(request.getParameter("store_description") != null) {
         store_description = request.getParameter("store_description");
      }else {
         store_description = storeDetail.getStore_description();
      }
      
      if(request.getParameter("store_img") != null) {
         store_img = request.getParameter("store_img");
      }else {
         store_img = storeDetail.getStore_img();
      }
      
      biz.setStore_id(store_id);
      biz.setStore_description(store_description);
      biz.setStore_time(store_time);
      biz.setStore_img(store_img);
      
      bizService.updateStoreDetail(biz);

   }
  // =====================================================MENU=====================================================
   // 메뉴 Detail 페이지 이동
   @RequestMapping(value = "/admin/store/adminMenuDetail.do", method = RequestMethod.GET)
   public ModelAndView adminMenuDetail(ModelAndView mv, HttpServletRequest request) {
      // 메뉴 디테일 정보를 얻어옴 
      String menu_id = null;
      if(request.getParameter("menu_id")!=null) {
         menu_id = request.getParameter("menu_id");
         // 메뉴 디테일 정보를 세션에 담기
         Menu menuDetail = menuService.selectOneMenuByMenuId(menu_id);
         request.getSession().setAttribute("menuDetail", menuDetail);
         
         // 해당 메뉴의 커스텀 리스트들을 세션에 담기
         List<Custom> customList = customService.selectListByMenuId(menu_id);
         System.out.println(customList.size() + " 개의 커스텀 목록을 가져왔습니다." );
         
         request.getSession().setAttribute("customList", customList);
      }else {
         System.out.println("메뉴 정보를 얻어올 수 없습니다.");
      }
      
      mv.setViewName("admin/adminMenuDetail");
      return mv;
   }
   
   
   // 메뉴 Detail 정보 수정 페이지로 이동
   @RequestMapping(value = "/admin/store/menuUpdateDetail.do", method = RequestMethod.GET)
   public ModelAndView updateMenuDetail(ModelAndView mv, HttpServletRequest request) {
      
      mv.setViewName("admin/adminMenuUpdate");
      return mv;
   }
   
   // 메뉴 update 
   @RequestMapping(value = "/admin/store/updateMenu.do", method = RequestMethod.POST)
   @ResponseBody
   public void updateMenu(HttpServletRequest request) {
      Menu menuDetail = (Menu)request.getSession().getAttribute("menuDetail");
      String menu_id = menuDetail.getMenu_id();
      String menu_name = null;
      String menu_img = null;
      String menu_description = null;
      String menu_category = null;
      int menu_price = 0;
      int result = 0;
      
      // null 값이면 기존에 있던 정보로 변경
      if(request.getParameter("menu_name") != null) {
         menu_name = request.getParameter("menu_name");
      }else {
         menu_name = menuDetail.getMenu_name();
      }
      if(request.getParameter("menu_img") != null) {
         menu_img = request.getParameter("menu_img");
      }else {
         menu_img = menuDetail.getMenu_img();
      }
      if(request.getParameter("menu_description") != null) {
         menu_description = request.getParameter("menu_description");
      }else {
         menu_description = menuDetail.getMenu_description();
      }
      if(request.getParameter("menu_category") != null) {
         menu_category = request.getParameter("menu_category");
      }else {
         menu_category = menuDetail.getMenu_category();
      }
      if(Integer.parseInt(request.getParameter("menu_price")) != 0) {
         menu_price = Integer.parseInt(request.getParameter("menu_price"));
      }else {
         menu_price = menuDetail.getMenu_price();
      }
      
      menu.setMenu_id(menu_id);
      menu.setMenu_name(menu_name);
      menu.setMenu_img(menu_img);
      menu.setMenu_category(menu_category);
      menu.setMenu_description(menu_description);
      menu.setMenu_price(menu_price);
      
      result = menuService.updateMenu(menu);
      if(result == 1) {
         System.out.println(menu.getMenu_id() + "의 메뉴정보 업데이트 완료");
      }else {
         System.out.println("실패");
      }
   }   
   
   
   // 메뉴 insert
   @RequestMapping(value = "/admin/store/insertMenu.do", method = RequestMethod.POST)
   @ResponseBody
   public void insertMenuDo(HttpServletRequest request) {
      String store_id = request.getParameter("store_id");
      String menu_name = request.getParameter("menu_name");
      int menu_price = Integer.parseInt(request.getParameter("menu_price"));
      String menu_img = request.getParameter("menu_img");
      String menu_description = request.getParameter("menu_description");
      String menu_category = request.getParameter("menu_category");
      int result = 0;
      // menu_name 중복 확인 해야함 
      
      // menu_img 가 null 이라면 기본값으로 셋팅해줘야함
      if(menu_img.equals("") || (menu_img == null)) {
         // 확인 필요
         menu_img = null;
      }
      menu.setStore_id(store_id);
      menu.setMenu_name(menu_name);
      menu.setMenu_price(menu_price);
      menu.setMenu_img(menu_img);
      menu.setMenu_description(menu_description);
      menu.setMenu_category(menu_category);

      result = menuService.insertMenu(menu);
      if(result == 1) {
         System.out.println(store_id + "의 메뉴 " + menu_name + " 추가 완료");
      }else {
         System.out.println(store_id + "의 메뉴 " + menu_name + " 추가 실패");
      }

   }
   // =====================================================CUSTOM=====================================================
   // custom 진입
   @RequestMapping(value = "/admin/store/customUpdateDetail.do", method = RequestMethod.GET)
   public ModelAndView updateCustomDetail(ModelAndView mv, HttpServletRequest request) {
      String custom_id = request.getParameter("custom_id");
      Custom customDetail = customService.selectOneCustomByCustomId(custom_id);
      if(customDetail == null) {
         System.out.println(custom_id + "의 커스텀 정보를 가져오지 못했습니다.");
      }else {
         request.getSession().setAttribute("customDetail", customDetail);
      }
      mv.setViewName("admin/adminCustomUpdate");
      return mv;
   }
   
   // 커스텀 update 
   @RequestMapping(value = "/admin/store/customUpdate.do", method = RequestMethod.POST)
   @ResponseBody
   public void updateCustom(HttpServletRequest request) {
      Custom customDetail = (Custom)request.getSession().getAttribute("customDetail");
      String custom_id = customDetail.getCustom_id();
      String custom_name = null;
      String custom_category = null;
      int custom_price = 0;
      int result = 0;
      
      // null 값이면 기존에 있던 정보로 변경
      if(request.getParameter("custom_name") != null) {
         custom_name = request.getParameter("custom_name");
      }else {
         custom_name = customDetail.getCustom_name();
      }
      if(request.getParameter("custom_category") != null) {
         custom_category = request.getParameter("custom_category");
      }else {
         custom_category = customDetail.getCustom_category();
      }
      if(request.getParameter("custom_price") != null) {
         custom_price = Integer.parseInt(request.getParameter("custom_price"));
      }else {
         custom_price = customDetail.getCustom_price();
      }

      custom.setCustom_id(custom_id);
      custom.setCustom_name(custom_name);
      custom.setCustom_category(custom_category);
      custom.setCustom_price(custom_price);
      
      result = customService.updateCustom(custom);
      
      if(result == 1) {
         System.out.println(custom.getCustom_id() + "의 커스텀정보 업데이트 완료");
      }else {
         System.out.println("커스텀정보 업데이트 실패");
      }
   }      
}