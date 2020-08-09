package com.everyair.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.everyair.www.dto.PagingDTO;
import com.everyair.www.dto.QnABoardDTO;
import com.everyair.www.service.PagingService;
import com.everyair.www.service.QnABoardService;

@Controller
public class QnABoardController {
	@Autowired
	private QnABoardService service;
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("/listQnABoard.do")
	public String listQnABoard(PagingDTO dto, Model model) {
		PagingDTO pagingDTO = pagingService.getPagingDTO(dto);
		
		if(dto.getKeyword() != null) {
			if(pagingDTO.getTotalCnt() == 0) {
				model.addAttribute("message", "검색 결과가 없습니다.");
				model.addAttribute("url", "listQnABoard.do?pageNo=1&table=qnaboard");
				return "result.jsp";
			}
		}
		
		List<QnABoardDTO> list = new ArrayList<QnABoardDTO>();
		list = pagingService.pageizedListQnABoard(pagingDTO);
		model.addAttribute("list", list);
		model.addAttribute("pagingDTO", pagingDTO);
		
		return "list_qnaboard.jsp";
	}
	
	@RequestMapping("/selectQnABoard.do")
	public String selectQnABoard(@RequestParam(value="status", required=false) String status,
			QnABoardDTO dto, Model model) {
		model.addAttribute("dto", service.selectQnA(dto));
		
		if(status.equals("view")) return "qnaboard_detail.jsp";
		else return "modify_qnaboard.jsp";
	}
	
	@RequestMapping("/writeQuestion.do")
	public String writeQuestion(HttpSession session, QnABoardDTO dto, Model model) {
		String nickname = (String)session.getAttribute("nickname");
		dto.setMembernickname(nickname);
		boolean result = service.insertQuestion(dto);
		
		if(result) {
			model.addAttribute("message", "질문이 등록되었습니다.");
			model.addAttribute("url", "listQnABoard.do?pageNo=1&table=qnaboard");
		} else {
			model.addAttribute("message", "질문 등록 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/modifyQnA.do")
	public String modifyQnA(@RequestParam(value="pageNo", required=false) String pageNo,
			QnABoardDTO dto, Model model) {
		boolean result = service.updateQnA(dto);
		
		if(result) {
			model.addAttribute("message", "수정이 완료되었습니다.");
			model.addAttribute("url", "selectQnABoard.do?no=" + dto.getNo() + "&pageNo=" + pageNo + "&status=view");
		} else {
			model.addAttribute("message", "수정 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/removeQnA.do")
	public String removeQnA(QnABoardDTO dto, Model model) {
		boolean result = service.deleteQuestion(dto);
		
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "listQnABoard.do?pageNo=1&table=qnaboard");
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
}
