package com.everyair.www.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.BoardDAO;
import com.everyair.www.dao.CommentDAO;
import com.everyair.www.dto.BoardDTO;
import com.everyair.www.dto.CommentDTO;
import com.everyair.www.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public BoardDTO selectBoard(BoardDTO dto) {
		BoardDTO boardDTO = dao.selectBoard(dto);
		boardDTO.setWtime(boardDTO.getWtime().substring(0, boardDTO.getWtime().length() - 3));
		return boardDTO;
	}
	
	@Override
	public void increaseHit(BoardDTO dto) {
		dao.increaseHit(dto);
	}
	
	@Override
	public List<CommentDTO> selectListComment(CommentDTO dto) {
		return commentDAO.selectListComment(dto);
	}

	@Override
	public boolean insertBoard(BoardDTO dto) {
		return dao.insertBoard(dto);
	}

	@Override
	public boolean updateBoard(BoardDTO dto) {
		return dao.updateBoard(dto);
	}

	@Override
	public boolean deleteBoard(BoardDTO dto) {
		return dao.deleteBoard(dto);
	}

	@Override
	public boolean insertComment(CommentDTO dto) {
		return commentDAO.insertComment(dto);
	}
	
	@Override
	public boolean replyComment(CommentDTO dto) {
		return commentDAO.replyComment(dto);
	}

	@Override
	public boolean updateComment(CommentDTO dto) {
		return commentDAO.updateComment(dto);
	}

	@Override
	public boolean deleteComment(CommentDTO dto) {
		return commentDAO.deleteComment(dto);
	}
}
