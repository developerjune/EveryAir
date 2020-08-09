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
import com.everyair.www.service.AdminQnABoardService;
import com.everyair.www.service.PagingService;

@Controller
public class AdminQnABoardController {
	@Autowired
	private AdminQnABoardService service;
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("/adminListQnABoard.do")
	public String listQnABoard(PagingDTO dto, Model model) {
		PagingDTO pagingDTO = pagingService.getPagingDTO(dto);
		
		if(dto.getKeyword() != null) {
			if(pagingDTO.getTotalCnt() == 0) {
				model.addAttribute("message", "검색 결과가 없습니다.");
				model.addAttribute("url", "adminListQnABoard.do?pageNo=1&table=qnaboard");
				return "result.jsp";
			}
		}
		
		List<QnABoardDTO> list = new ArrayList<QnABoardDTO>();
		list = pagingService.adminPageizedListQnABoard(pagingDTO);
		model.addAttribute("list", list);
		model.addAttribute("pagingDTO", pagingDTO);
		
		return "admin_list_qnaboard.jsp";
	}
	
	@RequestMapping("/adminSelectQnABoard.do")
	public String selectQnABoard(QnABoardDTO dto, Model model) {
		QnABoardDTO questionDTO = service.selectQuestion(dto);
		QnABoardDTO answerDTO = service.selectAnswer(dto);
		
		model.addAttribute("questionDTO", questionDTO);
		model.addAttribute("answerDTO", answerDTO);
		
		return "admin_qnaboard_detail.jsp";
	}
	
	@RequestMapping("/adminSelectQuestion.do")
	public String selectQuestion(QnABoardDTO dto, Model model) {
		QnABoardDTO qnaboardDTO = service.selectQuestionByNumber(dto);
		
		model.addAttribute("dto", qnaboardDTO);
		
		return "reply_form.jsp";
	}
	
	@RequestMapping("/adminAnswerQuestion.do")
	public String answerQuestion(@RequestParam(value="pageNo", required=false) String pageNo,
			HttpSession session, QnABoardDTO dto, Model model) {
		String nickname = (String)session.getAttribute("nickname");
		dto.setMembernickname(nickname);
		
		boolean result = service.answerQuestion(dto);
		
		if(result) {
			model.addAttribute("message", "답변 등록이 완료되었습니다.");
			model.addAttribute("url", "adminSelectQnABoard.do?groupnum=" + dto.getGroupnum() + "&pageNo=" + pageNo);
		} else {
			model.addAttribute("message", "답변 등록 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminModifyAnswer.do")
	public String modifyAnswer(@RequestParam(value="pageNo", required=false) String pageNo,
			QnABoardDTO dto, Model model) {
		boolean result = service.updateAnswer(dto);
		
		if(result) {
			model.addAttribute("message", "답변 수정이 완료되었습니다.");
			model.addAttribute("url", "adminSelectQnABoard.do?groupnum=" + dto.getGroupnum() + "&pageNo=" + pageNo);
		} else {
			model.addAttribute("message", "답변 수정 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminRemoveAnswer.do")
	public String removeAnswer(@RequestParam(value="pageNo", required=false) String pageNo,
			QnABoardDTO dto, Model model) {
		boolean result = service.deleteAnswer(dto);
		
		if(result) {
			model.addAttribute("message", "답변 삭제가 완료되었습니다.");
			model.addAttribute("url", "adminSelectQnABoard.do?groupnum=" + dto.getGroupnum() + "&pageNo=" + pageNo);
		} else {
			model.addAttribute("message", "답변 삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminRemoveQnA.do")
	public String removeQnA(QnABoardDTO dto, Model model) {
		boolean result = service.deleteQnA(dto);
		
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "adminListQnABoard.do?pageNo=1&table=qnaboard");
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminMultiRemoveQnA.do")
	public String multiRemoveQnA(@RequestParam(value="strNum", required=false) String strNum,
			Model model) {
		boolean result = service.multiDeleteQnA(strNum);
		
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "adminListQnABoard.do?pageNo=1&table=qnaboard");
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
}
