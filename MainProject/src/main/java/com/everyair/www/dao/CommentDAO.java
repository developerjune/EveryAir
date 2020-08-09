package com.everyair.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.CommentDTO;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static CommentDAO dao;
	
	public static CommentDAO getCommentDAO() {
		if(dao == null)
			dao = new CommentDAO();
		return dao;
	}
	
	public List<CommentDTO> selectListComment(CommentDTO dto) {
		return mybatis.selectList("CommentDAO.selectListComment", dto);
	}
	
	public boolean insertComment(CommentDTO dto) {
		int groupnum = mybatis.selectOne("CommentDAO.selectMaxCommentNum");
		groupnum++;
		dto.setGroupnum(groupnum);
		
		int result = mybatis.insert("CommentDAO.insertComment", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean replyComment(CommentDTO dto) {
		int stepnum = mybatis.selectOne("CommentDAO.selectMaxStepNum", dto);
		dto.setStepnum(stepnum + 1);
		dto.setIndentnum(1);
		int result = mybatis.insert("CommentDAO.replyComment", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean updateComment(CommentDTO dto) {
		int result = mybatis.update("CommentDAO.updateComment", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean deleteComment(CommentDTO dto) {
		int result = mybatis.update("CommentDAO.deleteComment", dto);
		
		if(result > 0) return true;
		else return false;
	}
}
