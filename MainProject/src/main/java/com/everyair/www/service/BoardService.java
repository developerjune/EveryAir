package com.everyair.www.service;

import java.util.List;

import com.everyair.www.dto.BoardDTO;
import com.everyair.www.dto.CommentDTO;

public interface BoardService {

	BoardDTO selectBoard(BoardDTO dto);
	
	void increaseHit(BoardDTO dto);
	
	boolean insertBoard(BoardDTO dto);
	
	boolean updateBoard(BoardDTO dto);
	
	boolean deleteBoard(BoardDTO dto);
	
	List<CommentDTO> selectListComment(CommentDTO dto);
	
	boolean insertComment(CommentDTO dto);
	
	boolean replyComment(CommentDTO dto);
	
	boolean updateComment(CommentDTO dto);
	
	boolean deleteComment(CommentDTO dto);
}
