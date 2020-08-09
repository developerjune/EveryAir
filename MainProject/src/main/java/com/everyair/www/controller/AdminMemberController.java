package com.everyair.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.everyair.www.dto.MemberDTO;
import com.everyair.www.dto.PagingDTO;
import com.everyair.www.service.AdminMemberService;
import com.everyair.www.service.PagingService;

@Controller
public class AdminMemberController {
	@Autowired
	private AdminMemberService service;
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("/adminListMember.do")
	public String getMemberList(PagingDTO dto, Model model) {
		PagingDTO pagingDTO = pagingService.getPagingDTO(dto);
		
		if(dto.getKeyword() != null) {
			if(pagingDTO.getTotalCnt() == 0) {
				model.addAttribute("message", "검색 결과가 없습니다.");
				model.addAttribute("url", "adminListMember.do?pageNo=1&table=member&denied=" + pagingDTO.getDenied());
				return "result.jsp";
			}
		}
		
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		list = pagingService.pageizedListMember(pagingDTO);
		model.addAttribute("list", list);
		model.addAttribute("pagingDTO", pagingDTO);
		
		if(dto.getDenied().equals("Y")) return "admin_list_member.jsp";
		return "admin_list_dormant_member.jsp";
	}
	
	@RequestMapping("/adminSelectMember.do")
	public String getMember(MemberDTO dto, Model model) {
		model.addAttribute("dto", service.selectMember(dto));
		
		return "admin_modify_member.jsp";
	}
	
	@RequestMapping("/adminModifyMember.do")
	public String modifyMember(@RequestParam(value="pagedenied", required=false, defaultValue="") String pagedenied,
			MemberDTO dto, Model model) {
		boolean result = service.updateMember(dto);
		
		if(result) {
			model.addAttribute("message", "수정이 완료되었습니다.");
			model.addAttribute("url", "adminListMember.do?pageNo=1&table=member&denied=" + pagedenied);
		} else {
			model.addAttribute("message", "수정 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminRemoveMember.do")
	public String removeMember(MemberDTO dto, Model model) {
		boolean result = service.deleteMember(dto);
		
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "adminListMember.do?pageNo=1&table=member&denied=" + dto.getDenied());
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminMultiRemoveMember.do")
	public String multiRemoveContent(@RequestParam(value="strNum", required=false) String strNum,
			MemberDTO dto, Model model) {
		boolean result = service.multiDeleteMember(strNum);
				
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "adminListMember.do?pageNo=1&table=member&denied=" + dto.getDenied());
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
}
