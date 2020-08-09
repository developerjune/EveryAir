package com.everyair.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.BoardDTO;
import com.everyair.www.dto.CommentDTO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static BoardDAO dao;
	
	public static BoardDAO getBoardDAO() {
		if(dao == null)
			dao = new BoardDAO();
		return dao;
	}
	
	public BoardDTO selectBoard(BoardDTO dto) {
		return mybatis.selectOne("BoardDAO.selectBoard", dto);
	}
	
	public void increaseHit(BoardDTO dto) {
		mybatis.update("BoardDAO.increaseHit", dto);
	}
	
	public boolean insertBoard(BoardDTO dto) {
		int result = mybatis.insert("BoardDAO.insertBoard", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean updateBoard(BoardDTO dto) {
		int result = mybatis.update("BoardDAO.updateBoard", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean deleteBoard(BoardDTO dto) {
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setBoardno(dto.getNo());
		mybatis.delete("CommentDAO.deleteAllComment", commentDTO);
		int result = mybatis.delete("BoardDAO.deleteBoard", dto);
		
		if(result > 0) return true;
		else return false;
	}
}
