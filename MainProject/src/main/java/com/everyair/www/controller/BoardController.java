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
import com.everyair.www.dto.CommentDTO;
import com.everyair.www.dto.PagingDTO;
import com.everyair.www.service.BoardService;
import com.everyair.www.service.PagingService;

@Controller
public class BoardController {
	@Autowired
	private PagingService pagingService;
	@Autowired
	private BoardService service;
	
	@RequestMapping("/listBoard.do")
	public String listBoard(PagingDTO dto, Model model) {
		PagingDTO pagingDTO = pagingService.getPagingDTO(dto);
		
		if(dto.getKeyword() != null) {
			if(pagingDTO.getTotalCnt() == 0) {
				model.addAttribute("message", "검색 결과가 없습니다.");
				model.addAttribute("url", "listBoard.do?pageNo=1&table=board");
				return "result.jsp";
			}
		}
		
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		list = pagingService.pageizedListBoard(pagingDTO);
		model.addAttribute("list", list);
		model.addAttribute("pagingDTO", pagingDTO);
		
		return "list_board.jsp";
	}
	
	@RequestMapping("/selectBoard.do")
	public String selectBoard(@RequestParam(value="status", required=false) String status,
			BoardDTO dto, Model model) {
		
		if(status.equals("view")) service.increaseHit(dto);
		
		BoardDTO boardDTO = service.selectBoard(dto);
		
		model.addAttribute("dto", boardDTO);
		
		if(status.equals("view")) {
			CommentDTO commentDTO = new CommentDTO();
			commentDTO.setBoardno(dto.getNo());
			List<CommentDTO> listComment = service.selectListComment(commentDTO);
			model.addAttribute("list", listComment);
			return "board_detail.jsp";
		} else return "modify_board.jsp";
	}
	
	@RequestMapping("/writeBoard.do")
	public String writeBoard(HttpSession session, BoardDTO dto, Model model) {
		dto.setMembernickname((String)session.getAttribute("nickname"));
		boolean result = service.insertBoard(dto);
		
		if(result) {
			model.addAttribute("message", "게시글 등록이 완료되었습니다.");
			model.addAttribute("url", "listBoard.do?pageNo=1&table=board");
		} else {
			model.addAttribute("message", "게시글 등록 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/modifyBoard.do")
	public String modifyBoard(@RequestParam(value="pageNo", required=false) String pageNo,
			BoardDTO dto, Model model) {
		boolean result = service.updateBoard(dto);
		
		if(result) {
			model.addAttribute("message", "게시글 수정이 완료되었습니다.");
			model.addAttribute("url", "selectBoard.do?no=" + dto.getNo() + "&pageNo=" + pageNo + "&status=view");
		} else {
			model.addAttribute("message", "게시글 수정 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/removeBoard.do")
	public String removeBoard(BoardDTO dto, Model model) {
		boolean result = service.deleteBoard(dto);
		
		if(result) {
			model.addAttribute("message", "게시글 삭제가 완료되었습니다.");
			model.addAttribute("url", "listBoard.do?pageNo=1&table=board");
		} else {
			model.addAttribute("message", "게시글 삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
		
	}
	
	@RequestMapping("/writeComment.do")
	public String writeComment(@RequestParam(value="pageNo", required=false) String pageNo,
			HttpSession session, CommentDTO dto, Model model) {
		dto.setMembernickname((String)session.getAttribute("nickname"));
		boolean result = service.insertComment(dto);
		
		if(result) {
			return "redirect:selectBoard.do?no=" + dto.getBoardno() + "&pageNo=" + pageNo + "&status=view";
		} else {
			model.addAttribute("message", "댓글 등록 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
			return "result.jsp";
		}
	}
	
	@RequestMapping("/replyComment.do")
	public String replyComment(@RequestParam(value="pageNo", required=false) String pageNo,
			HttpSession session, CommentDTO dto, Model model) {
		dto.setMembernickname((String)session.getAttribute("nickname"));
		if(dto.getReceiver() == null) dto.setReceiver("");
		boolean result = service.replyComment(dto);
		
		if(result) {
			return "redirect:selectBoard.do?no=" + dto.getBoardno() + "&pageNo=" + pageNo + "&status=view";
		} else {
			model.addAttribute("message", "댓글 등록 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
			return "result.jsp";
		}
	}
	
	@RequestMapping("/modifyComment.do")
	public String modifyComment(@RequestParam(value="pageNo", required=false) String pageNo,
			CommentDTO dto, Model model) {
		boolean result = service.updateComment(dto);
		
		if(result) {
			return "redirect:selectBoard.do?no=" + dto.getBoardno() + "&pageNo=" + pageNo + "&status=view";
		} else {
			model.addAttribute("message", "댓글 등록 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
			return "result.jsp";
		}
	}
	
	@RequestMapping("/removeComment.do")
	public String removeComment(@RequestParam(value="pageNo", required=false) String pageNo,
			CommentDTO dto, Model model) {
		boolean result = service.deleteComment(dto);
		
		if(result) {
			model.addAttribute("message", "댓글 삭제가 완료되었습니다.");
			model.addAttribute("url", "selectBoard.do?no=" + dto.getBoardno() + "&pageNo=" + pageNo + "&status=view");
		} else {
			model.addAttribute("message", "댓글 삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
}
