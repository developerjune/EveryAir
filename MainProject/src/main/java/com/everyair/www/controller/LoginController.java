package com.everyair.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.everyair.www.dto.MemberDTO;
import com.everyair.www.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/loginOK.do", method=RequestMethod.POST)
	public String login(@RequestParam(value="url", required=false, defaultValue="") String prePage,
			MemberDTO dto, Model model, HttpSession session) {
		MemberDTO memberDTO = service.checkAccount(dto);
		
		if(memberDTO != null) {
			session.setAttribute("id", memberDTO.getId());
			session.setAttribute("nickname", memberDTO.getNickname());
			session.setMaxInactiveInterval(60*60*24);
			
			if(prePage.equals("")) {
				model.addAttribute("loginStatus", "Y");
				return "main.jsp";
			} else {
				return prePage;
			}
		} else {
			if(prePage.equals("")) {
				model.addAttribute("loginStatus", "N");
				return "main.jsp";
			} else {
				model.addAttribute("message", "아이디 혹은 비밀번호가 맞지 않습니다.");
				model.addAttribute("url", "wrong");
				return "result.jsp";
			}
		}
	}
}
