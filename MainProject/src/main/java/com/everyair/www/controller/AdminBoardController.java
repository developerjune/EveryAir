package com.everyair.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.everyair.www.dto.BoardDTO;
import com.everyair.www.dto.PagingDTO;
import com.everyair.www.service.AdminBoardService;
import com.everyair.www.service.PagingService;

@Controller
public class AdminBoardController {
	@Autowired
	private AdminBoardService service;
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("/adminListBoard.do")
	public String listBoard(PagingDTO dto, Model model) {
		PagingDTO pagingDTO = pagingService.getPagingDTO(dto);
		
		if(dto.getKeyword() != null) {
			if(pagingDTO.getTotalCnt() == 0) {
				model.addAttribute("message", "검색 결과가 없습니다.");
				model.addAttribute("url", "adminListBoard.do?pageNo=1&table=board");
				return "result.jsp";
			}
		}
		
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		list = pagingService.adminPageizedListBoard(pagingDTO);
		model.addAttribute("list", list);
		model.addAttribute("pagingDTO", pagingDTO);
		
		return "admin_list_board.jsp";
	}
	
	@RequestMapping("/adminSelectBoard.do")
	public String selectBoard(BoardDTO dto, Model model) {
		BoardDTO boardDTO = service.selectBoard(dto);
		model.addAttribute("dto", boardDTO);
		
		return "admin_board_detail.jsp";
	}
	
	@RequestMapping("/adminWriteNotice.do")
	public String writeNotice(HttpSession session, BoardDTO dto, Model model) {
		String nickname = (String)session.getAttribute("nickname");
		dto.setMembernickname(nickname);
		boolean result = service.insertNotice(dto);
		
		if(result) {
			model.addAttribute("message", "공지 등록이 완료되었습니다.");
			model.addAttribute("url", "adminListBoard.do?pageNo=1&table=board");
		} else {
			model.addAttribute("message", "공지 등록 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminModifyBoard.do")
	public String modifyBoard(BoardDTO dto, Model model) {
		boolean result = service.updateBoard(dto);
		
		if(result) {
			model.addAttribute("message", "수정이 완료되었습니다.");
			model.addAttribute("url", "adminListBoard.do?pageNo=1&table=board");
		} else {
			model.addAttribute("message", "수정 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminRemoveBoard.do")
	public String removeBoard(BoardDTO dto, Model model) {
		boolean result = service.deleteBoard(dto);
		
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "adminListBoard.do?pageNo=1&table=board");
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminMultiRemoveBoard.do")
	public String multiRemoveBoard(@RequestParam(value="strNum", required=false) String strNum,
			Model model) {
		boolean result = service.multiDeleteBoard(strNum);
		
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "adminListBoard.do?pageNo=1&table=board");
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
}
