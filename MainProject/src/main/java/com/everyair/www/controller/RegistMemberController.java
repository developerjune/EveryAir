package com.everyair.www.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.everyair.www.dto.ConfirmNumDTO;
import com.everyair.www.dto.MemberDTO;
import com.everyair.www.service.RegistMemberService;

@Controller
public class RegistMemberController {
	@Autowired
	private RegistMemberService service;
	
	@RequestMapping("/checkID.do")
	public void checkIDDuplicate(MemberDTO dto, Model model, HttpServletResponse response) throws IOException {
		boolean result = service.checkIDDuplicate(dto);
		response.setContentType("text/html;charset=UTF-8");
		
		if(result)
			response.getWriter().write("Y");
		else
			response.getWriter().write("N");
	}
	
	@RequestMapping("/checkNickname.do")
	public void checkNicknameDuplicate(MemberDTO dto, Model model, HttpServletResponse response) throws IOException {
		boolean result = service.checkNicknameDuplicate(dto);
		response.setContentType("text/html;charset=UTF-8");
		
		if(result)
			response.getWriter().write("Y");
		else
			response.getWriter().write("N");
	}
	
	@RequestMapping("/sendSMS.do")
	public String sendConfirmNumber(MemberDTO dto, Model model) {
		service.sendConfirmNum(dto);
		
		return "redirect:check_confirmnum_form.jsp?phonenumber=" + dto.getPhonenumber();
	}
	
	@RequestMapping("/checkConfirmNum.do")
	public String checkConfirmNumber(ConfirmNumDTO confirmNumDTO, MemberDTO memberDTO, Model model) {
		Map<String, String> map = service.checkConfirmNumber(memberDTO, confirmNumDTO);
		
		if(map.containsKey("success")) {
			model.addAttribute("message", "번호 인증이 완료되었습니다.");
			model.addAttribute("status", "0");
			model.addAttribute("phonenumber", memberDTO.getPhonenumber());
		} else if(map.containsKey("fail")) {
			if(map.get("fail").equals("번호 인증 오류")) {
				model.addAttribute("message", "인증 번호가 불일치합니다.");
				model.addAttribute("status", "1");
			} else if(map.get("fail").equals("기등록 번호")) {
				model.addAttribute("message", "이미 가입된 번호입니다.");
				model.addAttribute("status", "2");
			}
		}
		
		return "checkPhoneNumberResult.jsp";
	}
	
	@RequestMapping("/registMemberOK.do")
	public String registMember(@RequestParam(value = "emailID", required = false) String emailID,
			@RequestParam(value = "domain", required = false) String domain,
			MemberDTO dto, Model model) {
		dto.setEmail(emailID.concat(domain));
		boolean result = service.registMember(dto);
		
		if(result) {
			model.addAttribute("message", "회원가입이 완료되었습니다. 로그인 후 사용해주세요.");
			model.addAttribute("url", "main.jsp");
		}
		
		return "result.jsp";
	}
}
