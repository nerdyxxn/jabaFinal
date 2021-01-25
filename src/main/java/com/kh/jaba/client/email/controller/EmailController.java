package com.kh.jaba.client.email.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaba.client.email.model.domain.Email;
import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.client.model.service.ClientService;

@Controller
public class EmailController {

	@Autowired
	private Email email;

	@Autowired
	protected JavaMailSender mailSender;

	@Autowired
	private Client client;

	@Autowired
	private ClientService clientService;

	@RequestMapping(value = "/client/sendpw.do")
	public void sendEmailAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("-------------------sendEmailAction 진입-------------------");
		PrintWriter out = response.getWriter();
		String e_mail = request.getParameter("lostemail");
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String tempPw = temp.toString();
		System.out.println(tempPw);

		// 비밀번호를 찾으려는 이메일이 DB에 존재 유무 확인
		int result = clientService.clientCheckId(e_mail);
		if (result == 1) {
			// 여기에 update 시킬 수 있는 메소드 들어가야함.
			client.setClient_id(e_mail);
			client.setClient_pw(tempPw);
			clientService.updateClientPw(client);
			// if 조건절에는 update 성공 시에로 바꿔야 한다.
			if (tempPw != null) {
				email.setContent("비밀번호는 " + tempPw + " 입니다.");
				email.setReceiver(e_mail);
				email.setSubject("JABA 비밀번호 찾기 메일입니다.");
				sendEmail(email);

			}
		} else {
			out.print("NotExistError");
		}

		out.flush();
		out.close();
	}

	public void sendEmail(Email email) throws Exception {
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));

		} catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		try {
			mailSender.send(msg);
		} catch (MailException e) {
			System.out.println("MailException발생");
			e.printStackTrace();
		}
	}

}
