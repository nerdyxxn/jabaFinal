package com.kh.jaba.client.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.admin.model.domain.Admin;
import com.kh.jaba.admin.model.service.AdminService;
import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.biz.model.service.BizService;
import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.client.model.service.ClientService;

@Controller
public class ClientController {

   @Autowired
   private ClientService clientService;
   @Autowired
   private BizService bizService;
   @Autowired
   private AdminService adminService;

   // storeService, adminService도 있어야함... --> 추가완료
   @RequestMapping(value = "/client/clientLogin.do", method = RequestMethod.GET)
   public void clientLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String client_id = request.getParameter("email");
      String client_pw = request.getParameter("pw");
      PrintWriter out = response.getWriter();

      Client client = clientService.loginClient(client_id, client_pw); // --> 수행하면 값이 있다면 Client 자료형으로 뭔가 나옵니다

      // id와 pw 정보가 client에 있는경우
      if (client != null) {
         System.out.println("로그인 성공 client_id : " + client.getClient_id());
         request.getSession().setAttribute("client", client);
         out.print("Client");
      } else {
         Biz biz = bizService.loginBiz(client_id, client_pw);
         // id와 pw 정보가 biz에 있는경우
         if (biz != null) {
            System.out.println("로그인 성공 biz_id : " + biz.getStore_id());
            request.getSession().setAttribute("biz", biz);
            out.print("BizPartner");
         } else {
            Admin admin = adminService.loginAdmin(client_id, client_pw);
            // id와 pw 정보가 admin에 있는경우
            if (admin != null) {
               System.out.println("로그인 성공 admin_id : " + admin.getAdmin_id());
               request.getSession().setAttribute("admin", admin);
               out.print("Admin");
               // id와 pw 정보가 없는 경우
            } else {
               System.out.println("로그인실패 , 일치하는 회원정보가 없습니다.");
               out.print("NotExist");
            }
         }
      }
      out.flush();
      out.close();
   }

   @RequestMapping(value = "client/clientLogout.do", method = RequestMethod.GET)
   @ResponseBody
   public void clientLogout(HttpServletRequest request) {
      // 만약 client 애트리뷰트가 있다면 client 애트리뷰트를 remove
      if(request.getSession().getAttribute("client") != null) {
         request.getSession().removeAttribute("client");
         System.out.println("클라이언트 로그아웃");
      }else{
         System.out.println("로그아웃할 client 가 없습니다.");
      }
   }

   // 회원가입
   @RequestMapping(value = "/client/clientRegister.do", method = RequestMethod.GET)
   @ResponseBody
   public void clientRegister(Client c) {
      int result = clientService.insertClient(c);
      if (result == 1) {
         System.out.println("회원가입 성공 client_id : " + c.getClient_id());
      } else {
         System.out.println("회원가입 실패");
      }
   }

   // ID중복체크
   @RequestMapping(value = "/client/clientCheckId.do", method = RequestMethod.GET)
   public void clientCheckId(HttpServletRequest request, HttpServletResponse response) throws IOException {
      PrintWriter out = response.getWriter();
      // ajax 에서 emailRegister 로 보내온 email을 받아옴
      String checkEmail = request.getParameter("emailRegister");
      // client, biz, admin에 모두 email이 없는경우
      if (clientService.clientCheckId(checkEmail) == 0 && bizService.bizCheckId(checkEmail) == 0 && adminService.adminCheckId(checkEmail) == 0) {
         out.print("ok");
         System.out.println("사용가능한 email입니다.");
         // 중복된 email인 경우
      } else {
         out.print("no");
         System.out.println("사용불가능한 email입니다.");
      }
      out.flush();
      out.close();
   }
   
   // 내정보 조회 페이지 이동
   // 이상태에서 이미 session에 client 정보가 담겨있음 
   // 만약 정보가 없다면에 대한 처리도 해야함 
   @RequestMapping(value = "/client/myPage.do", method = RequestMethod.GET)
   public ModelAndView editProfile(ModelAndView mv, HttpServletRequest request) {
      // 세션에 담겨있는 client 를 확인하고 만약 세션에 담겨있지않으면 index페이지로 보낸다.
      Client client = (Client)request.getSession().getAttribute("client");
      if(client != null) {
         System.out.println("editProfile 페이지 진입");
         mv.setViewName("client/editProfile");
      }else {
         mv.setViewName("index");
      }
      return mv;
   }
   
   // client 비밀번호 변경 페이지 이동
   @RequestMapping(value = "/client/updatePw.do", method = RequestMethod.GET)
   public ModelAndView updatePw(ModelAndView mv) {
      System.out.println("updatePw 페이지 진입");
      mv.setViewName("client/updatePw");
      return mv;
   }
   
   // client 수정
   @RequestMapping(value = "/client/editProfile.do", method = RequestMethod.GET)
   @ResponseBody
   public void editProfileDo(HttpServletRequest request, Client c) {
      Client currentClient = (Client)request.getSession().getAttribute("client");
      c.setClient_id(currentClient.getClient_id());
      int result = clientService.updateClient(c);
      if(result == 1) {
         System.out.println(c.getClient_id() + "의 회원정보가 수정되었습니다.");
         currentClient.setClient_name(c.getClient_name());
         currentClient.setClient_phone(c.getClient_phone());
         currentClient.setClient_birth(c.getClient_birth());
         currentClient.setClient_gender(c.getClient_gender());
         request.getSession().removeAttribute("client");
         request.getSession().setAttribute("client", currentClient);
      }else {
         System.out.println("회원정보 수정 실패");
      }
   }
   
   // client 비밀번호 수정
   @RequestMapping(value = "/client/updateClientPw.do", method = RequestMethod.GET)
   @ResponseBody
   public void updateClientPw(HttpServletRequest request) {
      Client currentClient = (Client)request.getSession().getAttribute("client");
      String client_pw = request.getParameter("client_pw");
      currentClient.setClient_pw(client_pw);
      int result = clientService.updateClientPw(currentClient);
      if(result == 1) {
         System.out.println(currentClient.getClient_id() + "의 비밀번호가 수정되었습니다.");
      }else {
         System.out.println("비밀번호 수정 실패");
      }
   }
   
   
   

}